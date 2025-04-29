#pragma once
// #include "common.h"

#include <muduo/net/TcpConnection.h>
#include <muduo/net/Buffer.h>
#include <muduo/base/Timestamp.h>
#include <unordered_map>
#include <string>
#include <memory>
#include <json/json.h>
#include <sstream>
using namespace muduo;
using namespace muduo::net;

struct http_request
{
	std::string method;									  // 请求方法
	std::string url;									  // 请求的 URL
	std::string version;								  // HTTP 版本
	std::unordered_map<std::string, std::string> headers; // 请求头
	std::string body;									  // 请求体
	//Json::Value json_body;								  // JSON 请求体
};

struct http_response
{
	int status_code;									  // 响应状态码
	std::string status_message;							  // 响应状态消息
	std::unordered_map<std::string, std::string> headers; // 响应头
	//std::string body;									  // 响应体
	std::stringstream body_stream;						  // 响应体流
};

class HttpConnection : public std::enable_shared_from_this<HttpConnection>
{
	friend class LogicSystem;

public:
	HttpConnection(const TcpConnectionPtr &);
	void Start();
	void HandleRequest(const TcpConnectionPtr &);
	std::string request_;

private:
	void WriteResponse();
	void PreParseGetParam();
	http_request http_request_;	  // HTTP 请求
	http_response http_response_; // HTTP 响应
	std::string response_;		  // 响应内容
	TcpConnectionPtr conn_;		  // 当前连接
								  // std::string get_url_;									  // GET 请求的 URL
	// std::unordered_map<std::string, std::string> get_params_; // GET 请求的参数
};
