cmake_minimum_required(VERSION 3.10)
project(MyChat)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
include(./common.cmake)

#头文件搜索路径
include_directories(/usr/include/muduo)
#库文件搜索路径
link_directories(/usr/local/lib/muduo)
link_directories(/usr/local/lib)

add_subdirectory(GateServer)
add_subdirectory(StatusServer)
add_subdirectory(ChatServer)
