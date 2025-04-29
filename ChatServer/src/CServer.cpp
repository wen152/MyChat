#include "CServer.h"
#include "CSession.h"
#include "UserMgr.h"
#include "RedisMgr.h"
#include <functional>

CServer::CServer(EventLoop *loop, const InetAddress &listenAddr, const std::string &serverName, int threadNum)
	: _server(loop, listenAddr, serverName)
{
	LOG_INFO << "Server started on " << listenAddr.toIpPort();
	_server.setConnectionCallback(std::bind(&CServer::onConnection, this, std::placeholders::_1));
	//_server.setMessageCallback(std::bind(&CServer::onMessage, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3));
	_server.setThreadNum(threadNum);
}

CServer::~CServer()
{
	LOG_INFO << "Server destruct listen on port: " << _server.ipPort();
}
void CServer::start()
{
	_server.start();
}

void CServer::onConnection(const TcpConnectionPtr &conn)
{
	if (conn->connected())
	{
		LOG_INFO << "New connection: " << conn->peerAddress().toIpPort();
		auto session = std::make_shared<CSession>(conn, this);
		_sessions.insert(std::make_pair(session->GetSessionId(), session));
		// session->Start();
	}
	else
	{
		LOG_INFO << "Connection closed: " << conn->peerAddress().toIpPort();
		// 寻找会话
		// auto it = _sessions.find(conn->name());
	}
}

void CServer::onMessage(const TcpConnectionPtr &conn, Buffer *buffer, Timestamp time)
{
}

void CServer::ClearSession(std::string session_id)
{

	lock_guard<mutex> lock(_mutex);
	if (_sessions.find(session_id) != _sessions.end())
	{
		auto uid = _sessions[session_id]->GetUserId();
		// 移除用户和session的关联
		UserMgr::GetInstance()->RmvUserSession(uid, session_id);
	}
	_sessions.erase(session_id);
}
shared_ptr<CSession> CServer::GetSession(std::string uuid)
{
	auto it = _sessions.find(uuid);
	if (it != _sessions.end())
	{
		return it->second;
	}
	return nullptr;
}