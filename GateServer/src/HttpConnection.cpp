#include "HttpConnection.h"
#include "LogicSystem.h"
#include <muduo/base/Logging.h>
#include <sstream>

HttpConnection::HttpConnection(const TcpConnectionPtr &conn) : conn_(conn) {}

// 开启监听该链接的数据接受请求
void HttpConnection::Start()
{
}

// 处理http请求
void HttpConnection::HandleRequest(const TcpConnectionPtr &conn)
{

	PreParseGetParam();
	if (http_request_.method == "GET")
	{
		bool success = LogicSystem::GetInstance()->HandleGet(http_request_.url, shared_from_this());
		if (!success)
		{
			LOG_INFO << "GET request not handled: " << http_request_.url;
			http_response_.status_code = 404;
			http_response_.status_message = "Not Found";
			http_response_.headers["Content-Type"] = "text/plain";
			http_response_.body_stream << "URL not found";
			WriteResponse();
			return;
		}
		WriteResponse();
		LOG_INFO << "GET request handled successfully: " << http_request_.url;
	}
	else if (http_request_.method == "POST")
	{
		bool success = LogicSystem::GetInstance()->HandlePost(http_request_.url, shared_from_this());
		if (!success)
		{
			LOG_INFO << "POST request not handled: " << http_request_.url;
			http_response_.status_code = 404;
			http_response_.status_message = "Not Found";
			http_response_.headers["Content-Type"] = "text/plain";
			http_response_.body_stream << "URL not found";
			WriteResponse();
			return;
		}
		WriteResponse();
		LOG_INFO << "POST request handled successfully: " << http_request_.url;
	}
	else
	{
		http_response_.status_code = 405;
		http_response_.status_message = "Method Not Allowed";
		http_response_.headers["Content-Type"] = "text/plain";
		http_response_.body_stream << "Unsupported HTTP method: " << http_request_.method;
		// 发送响应
		WriteResponse();
		LOG_INFO << "Unsupported HTTP method: " << http_request_.method;
		return;
	}
	// 清空缓冲区，准备接收下一个请求
    request_.clear();
}

// 定时器
// void HttpConnection::CheckDeadline()

void HttpConnection::WriteResponse()
{
	response_ = "HTTP/1.1 " + std::to_string(http_response_.status_code) + " " + http_response_.status_message + "\r\n";
	for (const auto &header : http_response_.headers)
	{
		response_ += header.first + ": " + header.second + "\r\n";
	}
	response_ += "\r\n" + http_response_.body_stream.str(); // 添加响应体
	// response_ += "\r\n\r\n";				   // 添加结束标志
	//  发送响应
	LOG_INFO << "Sending response: " << response_;
	conn_->send(response_); // 发送响应
	conn_->shutdown();		// 短连接，发送完响应后关闭连接
}

void HttpConnection::PreParseGetParam()
{
	// 查找请求头和请求体的分隔符
	size_t headerEnd = request_.find("\r\n\r\n");
	if (headerEnd == std::string::npos)
	{
		LOG_INFO << "Incomplete HTTP request, waiting for more data...";
		return; // 请求头未完整，等待更多数据
	}
	// 分离请求头和请求体
	std::string headers = request_.substr(0, headerEnd);
	std::string body = request_.substr(headerEnd + 4); // 跳过 "\r\n\r\n"

	// 解析请求行
	std::istringstream requestStream(headers);
	std::string line;
	std::getline(requestStream, line);
	std::istringstream request_line(line);
	std::string method, url, version;
	if (!(request_line >> method >> url >> version))
	{
		LOG_ERROR << "Failed to parse HTTP request line";
		return;
	}

	http_request_.method = method;
	LOG_INFO << "Parsed method: " << method;
	http_request_.url = url;
	LOG_INFO << "Parsed URL: " << url;
	http_request_.version = version;
	LOG_INFO << "Parsed version: " << version;
	// 解析请求头部
	while (std::getline(requestStream, line))
	{
		// 去掉行末的 '\r'（如果有）
		if (!line.empty() && line.back() == '\r')
			line.pop_back();
		size_t colonPos = line.find(':');
		if (colonPos != std::string::npos)
		{
			std::string key = line.substr(0, colonPos);
			std::string value = line.substr(colonPos + 1);
			// 去掉可能的空格
			key.erase(key.find_last_not_of(" \t\r\n") + 1);
			value.erase(0, value.find_first_not_of(" \t\r\n"));
			http_request_.headers[key] = value;
			LOG_INFO << "Header: " << key << " = " << value;
		}
	}

	// 如果是 POST 请求，解析请求体
	if (method == "POST")
	{
		http_request_.body = body;
		LOG_INFO << "Body: " << http_request_.body;
		// 使用 JsonCpp 解析 JSON 请求体
		Json::Value jsonData;
		Json::Reader jsonReader;
		if (!jsonReader.parse(body, jsonData))
		{
			LOG_ERROR << "Failed to parse JSON body: " << body;
		}
		else
		{
			//http_request_.json_body = jsonData; // 将解析后的 JSON 存储到结构体中
			LOG_INFO << "Parsed JSON body: " << jsonData.toStyledString();
		}
	}
}