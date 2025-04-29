// ChatServer.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//
// #include "LogicSystem.h"
#include <csignal>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <muduo/net/Channel.h>
#include <sys/signalfd.h>
#include "CServer.h"
#include "ConfigMgr.h"
#include "RedisMgr.h"
#include "ChatServiceImpl.h"
#include "common.h"

using namespace std;
bool bstop = false;
std::condition_variable cond_quit;
std::mutex mutex_quit;

int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		std::cerr << "Usage: " << argv[0] << " <config_file>" << std::endl;
		return 1;
	}
	ConfigMgr::Initialize(argv[1]);
	auto &cfg = ConfigMgr::Inst();
	auto serverName = cfg["SelfServer"]["Name"];
	try
	{
		// 将登录数设置为0
		RedisMgr::GetInstance()->InitCount(serverName);

		// Ensure Redis cleanup on exit
		Defer deferClean([serverName]()
						 {
        RedisMgr::GetInstance()->HDel(LOGIN_COUNT, serverName);
        RedisMgr::GetInstance()->Close(); });

		// 2) Set up Muduo EventLoop + ThreadPool
		EventLoop loop;
		uint16_t port = static_cast<uint16_t>(atoi(cfg["SelfServer"]["Port"].c_str()));
		InetAddress listenAddr(port);
		auto pointer_server = make_shared<CServer>(&loop, listenAddr, serverName);
		pointer_server->start();
		loop.loop();

		// 4) Start gRPC service in its own thread
		string rpcAddr = cfg["SelfServer"]["Host"] + ":" + cfg["SelfServer"]["RPCPort"];
		ChatServiceImpl service;
		grpc::ServerBuilder builder;
		builder.AddListeningPort(rpcAddr, grpc::InsecureServerCredentials());
		builder.RegisterService(&service);
		service.RegisterServer(pointer_server); // allow ChatServiceImpl to call into CServer
		auto grpcServer = builder.BuildAndStart();
		if (!grpcServer)
		{
			cerr << "Failed to start gRPC server on " << rpcAddr << endl;
			return 1;
		}
		cout << "gRPC listening on " << rpcAddr << endl;

		thread grpcThread([&]()
						  { grpcServer->Wait(); });

		// 5) Unified signal handling via signalfd + Muduo Channel
		sigset_t mask;
		sigemptyset(&mask);
		sigaddset(&mask, SIGINT);
		sigaddset(&mask, SIGTERM);
		::sigprocmask(SIG_BLOCK, &mask, nullptr);
		int sigfd = ::signalfd(-1, &mask, 0);

		Channel signalCh(&loop, sigfd);
		signalCh.setReadCallback([&](Timestamp)
								 {
									 uint64_t signals;
									 ::read(sigfd, &signals, sizeof(signals));
									 cout << "Signal received, shutting down..." << endl;
									 // a) stop accepting new TCP connections
									 //pointer_server->stop(); // assume CServer::stop() exists
									 // b) shut down gRPC
									 grpcServer->Shutdown();
									 // c) quit Muduo loops
									 loop.quit(); });
		signalCh.enableReading();
		// 6) Register CServer with LogicSystem (if needed)
		// LogicSystem::GetInstance()->SetServer(pointer_server);
		// 7) Enter Muduo event loop (blocks until quit())
		loop.loop();
		// 8) Cleanup gRPC thread
		grpcThread.join();
		::close(sigfd);
		cout << "ChatServer exited cleanly." << endl;
	}
	catch (std::exception &e)
	{
		std::cerr << "Exception: " << e.what() << endl;
	}
}
