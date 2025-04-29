#include "GateServer.h"
#include "HttpConnection.h"
#include <memory>
#include <boost/any.hpp>
using namespace std::placeholders;

GateServer::GateServer(EventLoop *loop, const InetAddress &listenAddr, const std::string &nameArg)
    : server_(loop, listenAddr, nameArg), loop_(loop)
{
    // 设置连接回调
    server_.setConnectionCallback(std::bind(&GateServer::onConnection, this, _1));
    // 设置消息回调
    server_.setMessageCallback(std::bind(&GateServer::onMessage, this, _1, _2, _3));

    server_.setThreadNum(4); // 设置线程池大小
}

void GateServer::Start()
{
    server_.start(); // 启动服务器
}

void GateServer::onConnection(const TcpConnectionPtr &conn)
{
    if (conn->connected())
    {
        LOG_INFO << "New connection from " << conn->peerAddress().toIpPort();
        // 在这里可以初始化与连接相关的资源
        // 类似于 HttpConnection::Start() 的逻辑
        auto httpConn = std::make_shared<HttpConnection>(conn);
        conn->setContext(httpConn); // 将 HttpConnection 绑定到连接上下文
    }
    else
    {
        LOG_INFO << "Connection disconnected from " << conn->peerAddress().toIpPort();
        // 清理连接相关的资源
        if (!conn->getContext().empty())
        {
            // auto httpConn = std::any_cast<std::shared_ptr<HttpConnection>>(conn->getContext());
            // httpConn->onDisconnect(); // 如果需要，可以在 HttpConnection 中定义清理逻辑
        }
    }
}

// 处理消息的回调
void GateServer::onMessage(const TcpConnectionPtr &conn, Buffer *buf, Timestamp time)
{
    // 使用 shared_ptr 管理 HttpConnection 的生命周期
    // 从连接上下文中获取 HttpConnection 对象
    if (conn->getContext().empty())
    {
        LOG_ERROR << "Connection context is empty!";
    }
    else
    {
        LOG_INFO << "Connection context type: " << conn->getContext().type().name();
    }
    auto httpConn = boost::any_cast<std::shared_ptr<HttpConnection>>(conn->getContext());
    // auto httpConn = std::make_shared<HttpConnection>(conn);
    std::string msg = buf->retrieveAllAsString();
    httpConn->request_ += msg; // 设置请求内容
    LOG_INFO << "Received message: " << httpConn->request_;
    size_t headerEnd = httpConn->request_.find("\r\n\r\n");
    if (headerEnd != std::string::npos)
    {
        std::string body = httpConn->request_.substr(headerEnd + 4);
        if (!body.empty())
            httpConn->HandleRequest(conn);
    }
    // httpConn->HandleRequest(conn); // 处理 HTTP 请求
    // conn->send(response);
}
