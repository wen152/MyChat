#include <muduo/base/Logging.h>
#include "CSession.h"
#include "ConfigMgr.h"
#include "RedisMgr.h"
#include "LogicSystem.h"
#include <iostream>
#include <functional>
CSession::CSession(const TcpConnectionPtr &conn, CServer *server)
    : server_(server), conn_(conn), b_close_(false), b_head_parse_(false), user_uid_(0)
{
    // 1) 生成一个唯一的会话ID
    boost::uuids::uuid a_uuid = boost::uuids::random_generator()();
    session_id_ = boost::uuids::to_string(a_uuid);
    recv_head_node_ = std::make_shared<MsgNode>(HEAD_TOTAL_LEN);
    conn_->setMessageCallback(std::bind(&CSession::HandleMessage, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3));
    conn_->setCloseCallback(std::bind(&CSession::HandleClose, this, std::placeholders::_1));
}
CSession::~CSession()
{
    std::cout << "~CSession destruct" << endl;
    // 此处减少服务器登录数量
    auto &cfg = ConfigMgr::Inst();
    auto self_name = cfg["SelfServer"]["Name"];
    RedisMgr::GetInstance()->DecreaseCount(self_name);
}

std::string &CSession::GetSessionId()
{
    return session_id_;
}
void CSession::Close()
{
    conn_->shutdown();
    b_close_ = true;
}
void CSession::SetUserId(int uid)
{
    user_uid_ = uid;
}

int CSession::GetUserId()
{
    return user_uid_;
}

void CSession::Start()
{
    // ReadHead(HEAD_TOTAL_LEN);
}

void CSession::Send(const std::string &msg, short msgid)
{
    std::lock_guard<std::mutex> lock(send_lock_);
    int send_que_size = send_que_.size();
    if (send_que_size > MAX_SENDQUE)
    {
        LOG_WARN << "session: " << session_id_ << " send queue full, size is " << MAX_SENDQUE;
        return;
    }

    send_que_.push(std::make_shared<SendNode>(msg.c_str(), msg.length(), msgid));
    if (send_que_size > 0)
    {
        return;
    }
    auto &msgnode = send_que_.front();
    conn_->send(msgnode->_data, msgnode->_total_len);
}

void CSession::HandleMessage(const TcpConnectionPtr &conn, Buffer *buf, Timestamp time)
{

    std::cout << "session handle message" << endl;
    int bytes_readed = buf->readableBytes();
    if (bytes_readed < HEAD_TOTAL_LEN)
    {
        std::cout << "read length not match, read [" << bytes_readed << "] , total ["
                  << HEAD_TOTAL_LEN << "]" << endl;
        Close();
        //server_->ClearSession(session_id_);
        return;
    }
    const char *data = buf->peek();
    recv_head_node_->Clear();
    memcpy(recv_head_node_->_data, data, HEAD_TOTAL_LEN); //??是因为这个吗
    // 获取头部MSGID数据
    short msg_id = 0;
    memcpy(&msg_id, recv_head_node_->_data, HEAD_ID_LEN);
    // 网络字节序转化为本地字节序
    msg_id = ntohs(msg_id);
    LOG_INFO << "msg_id is " << msg_id;
    // id非法
    if (msg_id < MSG_CHAT_LOGIN || msg_id > ID_NOTIFY_OFF_LINE_REQ)
    {
        LOG_INFO << "invalid msg_id is " << msg_id;
        //server_->ClearSession(session_id_);
        return;
    }
    short msg_len = 0;
    memcpy(&msg_len, recv_head_node_->_data + HEAD_ID_LEN, HEAD_DATA_LEN);
    msg_len = ntohs(msg_len); // 网络字节序转主机字节序
    LOG_INFO << "msg_len is " << msg_len;
    recv_msg_node_ = make_shared<RecvNode>(msg_len, msg_id);
    memcpy(recv_msg_node_->_data, data + HEAD_TOTAL_LEN, msg_len);
    recv_msg_node_->_cur_len = msg_len;
    recv_msg_node_->_data[recv_msg_node_->_total_len] = '\0';
    LOG_INFO << "recv msg is " << recv_msg_node_->_data;
    auto sharedThis = shared_from_this();
    LogicSystem::GetInstance()->PostMsgToQue(std::make_shared<LogicNode>(sharedThis, recv_msg_node_));
    // 读取消息体
    buf->retrieve(HEAD_TOTAL_LEN + msg_len);
}
void CSession::HandleClose(const TcpConnectionPtr &conn)
{
    std::cout << "session close" << endl;
    conn->shutdown();
    b_close_ = true;
}

void CSession::NotifyOffline(int uid)
{
    Json::Value rtvalue;
    rtvalue["erron"] = ErrorCodes::Success;
    rtvalue["uid"] = uid;

    std::string return_str = rtvalue.toStyledString();

    Send(return_str, ID_NOTIFY_OFF_LINE_REQ);
    return;
}
LogicNode::LogicNode(shared_ptr<CSession> session,
                     shared_ptr<RecvNode> recvnode) : _session(session), _recvnode(recvnode)
{
}