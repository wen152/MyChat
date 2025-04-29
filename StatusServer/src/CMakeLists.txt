aux_source_directory(. SRC_LIST)
add_executable(StatusServer ${SRC_LIST})
#find_package(Protobuf REQUIRED)
# 确保在源文件编译时也使用 C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
find_package(PkgConfig REQUIRED)
pkg_check_modules(MYSQL REQUIRED mysqlclient)

target_link_libraries(StatusServer
    ${_REFLECTION}
    ${_GRPC_GRPCPP}
    ${_PROTOBUF_LIBPROTOBUF}
    boost_system
    boost_filesystem  
    muduo_net
    muduo_base 
    pthread
    jsoncpp
    hiredis
    ${MYSQL_LIBRARIES}
    mysqlcppconn
    protobuf
)
target_compile_features(StatusServer PRIVATE cxx_std_14)