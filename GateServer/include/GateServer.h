#include <muduo/base/Logging.h>
#include <muduo/net/EventLoop.h>
#include <muduo/net/TcpServer.h>
using namespace muduo;
using namespace muduo::net;

//#include "common.h"


class GateServer
{
public:
    GateServer(EventLoop *, const InetAddress &,const string&);

    void Start();

private:
    // 处理新连接的回调
    void onConnection(const TcpConnectionPtr &);

    void onMessage(const TcpConnectionPtr &, Buffer *, Timestamp);

private:
    EventLoop *loop_;
    TcpServer server_;
};