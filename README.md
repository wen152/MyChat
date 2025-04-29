# MyChat
基于Muduo网络库的分布式聊天服务器  
1.GateServer为网关服务,用于客户端连接与注册请求  运行示例 ./GateServer 192.168.233.128 8080  
2.VerifyServer为验证服务,用于客户端验证  运行示例 npm run serve  
3.StatusServer为状态服务,用于负载均衡  运行示例 ./StatusServer  
4.ChatServer为聊天服务  运行示例 ./ChatServer ChatServer1_config.ini