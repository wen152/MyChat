#include <muduo/base/Logging.h>
#include "LogicSystem.h"
#include "HttpConnection.h"
#include "VerifyGrpcClient.h"
#include "RedisMgr.h"
#include "MysqlMgr.h"
#include "StatusGrpcClient.h"

LogicSystem::LogicSystem()
{
	_get_handlers.insert({"/get_test", std::bind(&LogicSystem::GetHandler, this, std::placeholders::_1)});
	_post_handlers.insert({"/get_verifycode", std::bind(&LogicSystem::PostVerifyHandler, this, std::placeholders::_1)});
	_post_handlers.insert({"/user_register", std::bind(&LogicSystem::UserRegisterHandler, this, std::placeholders::_1)});
	_post_handlers.insert({"/user_login", std::bind(&LogicSystem::UserLoginHandler, this, std::placeholders::_1)});
}

// void LogicSystem::RegGet(std::string url, HttpHandler handler)
// {
// 	_get_handlers.insert(make_pair(url, handler));
// }

// void LogicSystem::RegPost(std::string url, HttpHandler handler)
// {
// 	_post_handlers.insert(make_pair(url, handler));
// }

LogicSystem::~LogicSystem()
{
}

bool LogicSystem::HandleGet(std::string path, std::shared_ptr<HttpConnection> con)
{
	if (_get_handlers.find(path) == _get_handlers.end())
	{
		return false;
	}

	_get_handlers[path](con);
	return true;
}

bool LogicSystem::HandlePost(std::string path, std::shared_ptr<HttpConnection> con)
{
	if (_post_handlers.find(path) == _post_handlers.end())
	{
		return false;
	}

	_post_handlers[path](con);
	return true;
}

void LogicSystem::GetHandler(std::shared_ptr<HttpConnection> connection)
{
	LOG_INFO << "Get test";
	connection->http_response_.status_code = 200;
	connection->http_response_.status_message = "OK";
	connection->http_response_.headers["Content-Type"] = "text/plain";
	connection->http_response_.body_stream << "GET request handled successfully";
}

void LogicSystem::PostVerifyHandler(std::shared_ptr<HttpConnection> connection)
{
	LOG_INFO << "get verify code";
	connection->http_response_.status_code = 200;
	connection->http_response_.status_message = "OK";
	connection->http_response_.headers["Content-Type"] = "text/json";
	// connection->http_response_.body_stream << "POST request handled successfully";
	auto body_str = connection->http_request_.body;
	std::cout << "receive body is " << body_str << std::endl;

	Json::Value root;
	Json::Reader reader;
	Json::Value src_root;
	bool parse_success = reader.parse(body_str, src_root);
	if (!parse_success)
	{
		std::cout << "Failed to parse JSON data!" << std::endl;
		root["erron"] = ErrorCodes::Error_Json;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr; // body可以是sstream吗
		return;
	}

	if (!src_root.isMember("email"))
	{
		std::cout << "Failed to parse JSON data!" << std::endl;
		root["erron"] = ErrorCodes::Error_Json;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	auto email = src_root["email"].asString();
	GetVerifyRsp rsp = VerifyGrpcClient::GetInstance()->GetVerifyCode(email);
	cout << "email is " << email << endl;
	root["erron"] = rsp.error();
	root["email"] = src_root["email"];
	std::string jsonstr = root.toStyledString();
	connection->http_response_.body_stream << jsonstr;
	return;
}

void LogicSystem::UserRegisterHandler(std::shared_ptr<HttpConnection> connection)
{
	LOG_INFO << "register user";
	connection->http_response_.status_code = 200;
	connection->http_response_.status_message = "OK";
	connection->http_response_.headers["Content-Type"] = "text/json";
	auto body_str = connection->http_request_.body;
	std::cout << "receive body is " << body_str << std::endl;
	Json::Value root;
	Json::Reader reader;
	Json::Value src_root;
	bool parse_success = reader.parse(body_str, src_root);
	if (!parse_success)
	{
		std::cout << "Failed to parse JSON data!" << std::endl;
		root["error"] = ErrorCodes::Error_Json;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	auto email = src_root["email"].asString();
	auto name = src_root["user"].asString();
	auto pwd = src_root["passwd"].asString();
	auto confirm = src_root["confirm"].asString();
	auto icon = src_root["icon"].asString();

	if (pwd != confirm)
	{
		std::cout << "password err " << std::endl;
		root["erron"] = ErrorCodes::PasswdErr;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	std::string verify_code;
	bool b_get_varify = RedisMgr::GetInstance()->Get(CODEPREFIX + src_root["email"].asString(), verify_code);
	if (!b_get_varify)
	{
		std::cout << " get verify code expired" << std::endl;
		root["erron"] = ErrorCodes::VerifyExpired;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	if (verify_code != src_root["verifycode"].asString())
	{
		std::cout << " verify code error" << std::endl;
		root["erron"] = ErrorCodes::VerifyCodeErr;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	int uid = MysqlMgr::GetInstance()->RegUser(name, email, pwd, icon);
	if (uid == 0 || uid == -1)
	{
		std::cout << " user or email exist" << std::endl;
		root["erron"] = ErrorCodes::UserExist;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}
	root["erron"] = 0;
	root["uid"] = uid;
	root["email"] = email;
	root["user"] = name;
	root["passwd"] = pwd;
	root["confirm"] = confirm;
	root["icon"] = icon;
	root["verifycode"] = src_root["verifycode"].asString();
	std::string jsonstr = root.toStyledString();
	connection->http_response_.body_stream << jsonstr;
	return;
}

void LogicSystem::UserLoginHandler(std::shared_ptr<HttpConnection> connection)
{
	LOG_INFO << "user login";
	connection->http_response_.status_code = 200;
	connection->http_response_.status_message = "OK";
	connection->http_response_.headers["Content-Type"] = "text/json";
	auto body_str = connection->http_request_.body;
	std::cout << "receive body is " << body_str << std::endl;
	Json::Value root;
	Json::Reader reader;
	Json::Value src_root;
	bool parse_success = reader.parse(body_str, src_root);
	if (!parse_success)
	{
		std::cout << "Failed to parse JSON data!" << std::endl;
		root["erron"] = ErrorCodes::Error_Json;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	auto email = src_root["email"].asString();
	auto pwd = src_root["passwd"].asString();
	UserInfo userInfo;
	bool pwd_valid = MysqlMgr::GetInstance()->CheckPwd(email, pwd, userInfo);
	if (!pwd_valid)
	{
		std::cout << " user pwd not match" << std::endl;
		root["error"] = ErrorCodes::PasswdInvalid;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	//???StatusServer????????????
	auto reply = StatusGrpcClient::GetInstance()->GetChatServer(userInfo.uid);
	if (reply.error())
	{
		std::cout << " grpc get chat server failed, error is " << reply.error() << std::endl;
		root["error"] = ErrorCodes::RPCFailed;
		std::string jsonstr = root.toStyledString();
		connection->http_response_.body_stream << jsonstr;
		return;
	}

	std::cout << "succeed to load userinfo uid is " << userInfo.uid << std::endl;
	root["erron"] = 0;
	root["email"] = email;
	root["uid"] = userInfo.uid;
	root["token"] = reply.token();
	root["host"] = reply.host();
	root["port"] = reply.port();
	std::string jsonstr = root.toStyledString();
	connection->http_response_.body_stream << jsonstr;
	return;
}