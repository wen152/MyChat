#pragma once

#include <muduo/net/TcpServer.h>
#include <muduo/net/EventLoop.h>
#include <muduo/base/Logging.h>
#include <memory>
#include <unordered_map>
#include <mutex>
#include <string>
#include "CSession.h"
using namespace muduo;
using namespace muduo::net;

class CServer
{
public:
	CServer(EventLoop *loop, const InetAddress &listenAddr, const std::string &serverName = "ChatServer", int threadNum = 4);
	~CServer();
	void ClearSession(std::string session_id);
	void start();

private:
	void onConnection(const TcpConnectionPtr &conn);
	void onMessage(const TcpConnectionPtr &conn, Buffer *buffer, Timestamp time);
	// void removeSession(const std::string &sessionId);
	shared_ptr<CSession> GetSession(std::string uuid);

private:
	std::mutex _mutex;
	TcpServer _server;
	std::unordered_map<std::string, std::shared_ptr<CSession>> _sessions;
};