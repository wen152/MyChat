// StatusServer.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//
#include <muduo/net/EventLoop.h>
#include <muduo/net/EventLoopThreadPool.h>
#include <muduo/net/Channel.h>
#include <sys/signalfd.h>
#include <iostream>
#include <json/json.h>
#include <json/value.h>
#include <json/reader.h>
#include "common.h"
#include "ConfigMgr.h"
#include <hiredis/hiredis.h>
#include "RedisMgr.h"
#include "MysqlMgr.h"
#include <iostream>
#include <memory>
#include <string>
#include <thread>
#include <boost/asio.hpp>
#include "StatusServiceImpl.h"
using namespace muduo;
using namespace muduo::net; // namespace

void RunServer()
{
	auto &cfg = ConfigMgr::Inst();
	std::string host = cfg["StatusServer"]["Host"];
	uint16_t port = atoi(cfg["StatusServer"]["Port"].c_str());
	std::string server_address(host + ":" + std::to_string(port));
	StatusServiceImpl service;

	// 构建并启动gRPC服务器
	grpc::ServerBuilder builder;
	builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
	builder.RegisterService(&service);
	std::unique_ptr<grpc::Server> server(builder.BuildAndStart());
	std::cout << "Server listening on " << server_address << std::endl;

	// 3. 创建 Muduo 主事件循环和线程池
	muduo::net::EventLoop baseLoop;
	muduo::net::EventLoopThreadPool pool(&baseLoop, "StatusServerPool");
	pool.setThreadNum(4);
	pool.start();

	// 4. 阻塞 SIGINT/SIGTERM，并创建 signalfd
	sigset_t mask;
	sigemptyset(&mask);
	sigaddset(&mask, SIGINT);
	sigaddset(&mask, SIGTERM);
	::sigprocmask(SIG_BLOCK, &mask, nullptr);
	int sigfd = ::signalfd(-1, &mask, 0);

	// 5. 在 baseLoop 上注册信号处理 Channel
	muduo::net::Channel signalChannel(&baseLoop, sigfd);
	signalChannel.setReadCallback([&, sigfd](muduo::Timestamp)
								  {
        uint64_t signals;
        ::read(sigfd, &signals, sizeof(signals));   // 清除事件
        std::cout << "Signal received, shutting down..." << std::endl;

        // 5.1 优雅关停 gRPC 服务器
        server->Shutdown();
        // 5.2 退出 Muduo 主循环
        baseLoop.quit(); });
	signalChannel.enableReading();
	
	// 6. 在独立线程中并行等待 gRPC 内部完成（可选）
	//    这里直接在主线程启动 Muduo 循环，同时 gRPC 内部 I/O 线程会处理请求，
	//    Shutdown() 后 server->Wait() 立即返回。
	std::thread grpcWaitThread([&]()
							   { server->Wait(); });
	grpcWaitThread.detach();

	// 7. 运行 Muduo 主事件循环（阻塞，直到 baseLoop.quit() 被调用）
	baseLoop.loop();

	// 8. 最后清理
	::close(sigfd);
	std::cout << "StatusServer stopped." << std::endl;
}

int main(int argc, char **argv)
{
	try
	{
		RunServer();
		RedisMgr::GetInstance()->Close();
	}
	catch (std::exception const &e)
	{
		std::cerr << "Error: " << e.what() << std::endl;
		RedisMgr::GetInstance()->Close();
		return EXIT_FAILURE;
	}

	return 0;
}
