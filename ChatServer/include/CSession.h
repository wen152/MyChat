#pragma once
#include <boost/uuid/uuid_io.hpp>
#include <boost/uuid/uuid_generators.hpp>
#include <muduo/net/TcpConnection.h>
#include <memory>
#include <mutex>
#include <queue>
#include <functional>
#include "MsgNode.h"

using namespace muduo;
using namespace muduo::net;

class CServer;
class LogicSystem;
class CSession : public std::enable_shared_from_this<CSession>
{
public:
    CSession(const TcpConnectionPtr &, CServer *server);
    ~CSession();
    std::string &GetSessionId();
    void SetUserId(int uid);
    int GetUserId();
    void Start();
    void Close();
    void Send(const std::string &, short msgid);
    void NotifyOffline(int uid);

private:
    void HandleMessage(const TcpConnectionPtr &, Buffer *, Timestamp);
    void HandleClose(const TcpConnectionPtr &);
    // void ReadHead(int);
    // void ReadBody(int);

private:
    CServer *server_;
    std::mutex logicSystemMutex;
    // 收到的消息结构
    std::shared_ptr<RecvNode> recv_msg_node_;
    // 收到的头部结构
    std::shared_ptr<MsgNode> recv_head_node_;
    bool b_close_;
    std::mutex send_lock_;
    bool b_head_parse_;

    int user_uid_;
    std::string session_id_;
    std::queue<std::shared_ptr<SendNode>> send_que_;
    TcpConnectionPtr conn_;
};

class LogicNode
{
    friend class LogicSystem;

public:
    LogicNode(shared_ptr<CSession>, shared_ptr<RecvNode>);

private:
    shared_ptr<CSession> _session;
    shared_ptr<RecvNode> _recvnode;
};