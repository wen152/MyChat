# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zcw/wenchat/MyChat

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zcw/wenchat/MyChat/build

# Include any dependencies generated for this target.
include GateServer/src/CMakeFiles/GateServer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.make

# Include the progress variables for this target.
include GateServer/src/CMakeFiles/GateServer.dir/progress.make

# Include the compile flags for this target's objects.
include GateServer/src/CMakeFiles/GateServer.dir/flags.make

GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o: ../GateServer/src/ConfigMgr.cpp
GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o -MF CMakeFiles/GateServer.dir/ConfigMgr.cpp.o.d -o CMakeFiles/GateServer.dir/ConfigMgr.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/ConfigMgr.cpp

GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/ConfigMgr.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/ConfigMgr.cpp > CMakeFiles/GateServer.dir/ConfigMgr.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/ConfigMgr.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/ConfigMgr.cpp -o CMakeFiles/GateServer.dir/ConfigMgr.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o: ../GateServer/src/GateServer.cpp
GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o -MF CMakeFiles/GateServer.dir/GateServer.cpp.o.d -o CMakeFiles/GateServer.dir/GateServer.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/GateServer.cpp

GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/GateServer.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/GateServer.cpp > CMakeFiles/GateServer.dir/GateServer.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/GateServer.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/GateServer.cpp -o CMakeFiles/GateServer.dir/GateServer.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o: ../GateServer/src/HttpConnection.cpp
GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o -MF CMakeFiles/GateServer.dir/HttpConnection.cpp.o.d -o CMakeFiles/GateServer.dir/HttpConnection.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/HttpConnection.cpp

GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/HttpConnection.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/HttpConnection.cpp > CMakeFiles/GateServer.dir/HttpConnection.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/HttpConnection.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/HttpConnection.cpp -o CMakeFiles/GateServer.dir/HttpConnection.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o: ../GateServer/src/LogicSystem.cpp
GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o -MF CMakeFiles/GateServer.dir/LogicSystem.cpp.o.d -o CMakeFiles/GateServer.dir/LogicSystem.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/LogicSystem.cpp

GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/LogicSystem.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/LogicSystem.cpp > CMakeFiles/GateServer.dir/LogicSystem.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/LogicSystem.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/LogicSystem.cpp -o CMakeFiles/GateServer.dir/LogicSystem.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o: ../GateServer/src/MysqlDao.cpp
GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o -MF CMakeFiles/GateServer.dir/MysqlDao.cpp.o.d -o CMakeFiles/GateServer.dir/MysqlDao.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/MysqlDao.cpp

GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/MysqlDao.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/MysqlDao.cpp > CMakeFiles/GateServer.dir/MysqlDao.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/MysqlDao.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/MysqlDao.cpp -o CMakeFiles/GateServer.dir/MysqlDao.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o: ../GateServer/src/MysqlMgr.cpp
GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o -MF CMakeFiles/GateServer.dir/MysqlMgr.cpp.o.d -o CMakeFiles/GateServer.dir/MysqlMgr.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/MysqlMgr.cpp

GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/MysqlMgr.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/MysqlMgr.cpp > CMakeFiles/GateServer.dir/MysqlMgr.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/MysqlMgr.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/MysqlMgr.cpp -o CMakeFiles/GateServer.dir/MysqlMgr.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o: ../GateServer/src/RedisMgr.cpp
GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o -MF CMakeFiles/GateServer.dir/RedisMgr.cpp.o.d -o CMakeFiles/GateServer.dir/RedisMgr.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/RedisMgr.cpp

GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/RedisMgr.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/RedisMgr.cpp > CMakeFiles/GateServer.dir/RedisMgr.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/RedisMgr.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/RedisMgr.cpp -o CMakeFiles/GateServer.dir/RedisMgr.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o: ../GateServer/src/StatusGrpcClient.cpp
GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o -MF CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o.d -o CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/StatusGrpcClient.cpp

GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/StatusGrpcClient.cpp > CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/StatusGrpcClient.cpp -o CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o: ../GateServer/src/VerifyGrpcClient.cpp
GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o -MF CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o.d -o CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/VerifyGrpcClient.cpp

GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/VerifyGrpcClient.cpp > CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/VerifyGrpcClient.cpp -o CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o: ../GateServer/src/main.cpp
GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o -MF CMakeFiles/GateServer.dir/main.cpp.o.d -o CMakeFiles/GateServer.dir/main.cpp.o -c /home/zcw/wenchat/MyChat/GateServer/src/main.cpp

GateServer/src/CMakeFiles/GateServer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/main.cpp.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/main.cpp > CMakeFiles/GateServer.dir/main.cpp.i

GateServer/src/CMakeFiles/GateServer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/main.cpp.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/main.cpp -o CMakeFiles/GateServer.dir/main.cpp.s

GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: ../GateServer/src/message.grpc.pb.cc
GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o -MF CMakeFiles/GateServer.dir/message.grpc.pb.cc.o.d -o CMakeFiles/GateServer.dir/message.grpc.pb.cc.o -c /home/zcw/wenchat/MyChat/GateServer/src/message.grpc.pb.cc

GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/message.grpc.pb.cc.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/message.grpc.pb.cc > CMakeFiles/GateServer.dir/message.grpc.pb.cc.i

GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/message.grpc.pb.cc.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/message.grpc.pb.cc -o CMakeFiles/GateServer.dir/message.grpc.pb.cc.s

GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o: GateServer/src/CMakeFiles/GateServer.dir/flags.make
GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o: ../GateServer/src/message.pb.cc
GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o: GateServer/src/CMakeFiles/GateServer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o -MF CMakeFiles/GateServer.dir/message.pb.cc.o.d -o CMakeFiles/GateServer.dir/message.pb.cc.o -c /home/zcw/wenchat/MyChat/GateServer/src/message.pb.cc

GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/GateServer.dir/message.pb.cc.i"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zcw/wenchat/MyChat/GateServer/src/message.pb.cc > CMakeFiles/GateServer.dir/message.pb.cc.i

GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/GateServer.dir/message.pb.cc.s"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zcw/wenchat/MyChat/GateServer/src/message.pb.cc -o CMakeFiles/GateServer.dir/message.pb.cc.s

# Object files for target GateServer
GateServer_OBJECTS = \
"CMakeFiles/GateServer.dir/ConfigMgr.cpp.o" \
"CMakeFiles/GateServer.dir/GateServer.cpp.o" \
"CMakeFiles/GateServer.dir/HttpConnection.cpp.o" \
"CMakeFiles/GateServer.dir/LogicSystem.cpp.o" \
"CMakeFiles/GateServer.dir/MysqlDao.cpp.o" \
"CMakeFiles/GateServer.dir/MysqlMgr.cpp.o" \
"CMakeFiles/GateServer.dir/RedisMgr.cpp.o" \
"CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o" \
"CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o" \
"CMakeFiles/GateServer.dir/main.cpp.o" \
"CMakeFiles/GateServer.dir/message.grpc.pb.cc.o" \
"CMakeFiles/GateServer.dir/message.pb.cc.o"

# External object files for target GateServer
GateServer_EXTERNAL_OBJECTS =

../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/ConfigMgr.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/GateServer.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/HttpConnection.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/LogicSystem.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/MysqlDao.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/MysqlMgr.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/RedisMgr.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/StatusGrpcClient.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/VerifyGrpcClient.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/main.cpp.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/message.grpc.pb.cc.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/message.pb.cc.o
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/build.make
../bin/GateServer: /usr/local/lib/libgrpc++_reflection.a
../bin/GateServer: /usr/local/lib/libgrpc++.a
../bin/GateServer: /usr/local/lib/libprotobuf.a
../bin/GateServer: /usr/local/lib/libgrpc.a
../bin/GateServer: /usr/local/lib/libssl.a
../bin/GateServer: /usr/local/lib/libcrypto.a
../bin/GateServer: /usr/local/lib/libz.a
../bin/GateServer: /usr/local/lib/libcares.a
../bin/GateServer: /usr/local/lib/libre2.a
../bin/GateServer: /usr/local/lib/libabsl_statusor.a
../bin/GateServer: /usr/local/lib/libabsl_hash.a
../bin/GateServer: /usr/local/lib/libabsl_bad_variant_access.a
../bin/GateServer: /usr/local/lib/libabsl_city.a
../bin/GateServer: /usr/local/lib/libabsl_raw_hash_set.a
../bin/GateServer: /usr/local/lib/libabsl_hashtablez_sampler.a
../bin/GateServer: /usr/local/lib/libabsl_exponential_biased.a
../bin/GateServer: /usr/local/lib/libgpr.a
../bin/GateServer: /usr/local/lib/libabsl_status.a
../bin/GateServer: /usr/local/lib/libabsl_cord.a
../bin/GateServer: /usr/local/lib/libabsl_bad_optional_access.a
../bin/GateServer: /usr/local/lib/libabsl_synchronization.a
../bin/GateServer: /usr/local/lib/libabsl_stacktrace.a
../bin/GateServer: /usr/local/lib/libabsl_symbolize.a
../bin/GateServer: /usr/local/lib/libabsl_debugging_internal.a
../bin/GateServer: /usr/local/lib/libabsl_demangle_internal.a
../bin/GateServer: /usr/local/lib/libabsl_graphcycles_internal.a
../bin/GateServer: /usr/local/lib/libabsl_time.a
../bin/GateServer: /usr/local/lib/libabsl_civil_time.a
../bin/GateServer: /usr/local/lib/libabsl_time_zone.a
../bin/GateServer: /usr/local/lib/libabsl_malloc_internal.a
../bin/GateServer: /usr/local/lib/libabsl_str_format_internal.a
../bin/GateServer: /usr/local/lib/libabsl_strings.a
../bin/GateServer: /usr/local/lib/libabsl_strings_internal.a
../bin/GateServer: /usr/local/lib/libabsl_int128.a
../bin/GateServer: /usr/local/lib/libabsl_throw_delegate.a
../bin/GateServer: /usr/local/lib/libabsl_base.a
../bin/GateServer: /usr/local/lib/libabsl_raw_logging_internal.a
../bin/GateServer: /usr/local/lib/libabsl_log_severity.a
../bin/GateServer: /usr/local/lib/libabsl_spinlock_wait.a
../bin/GateServer: /usr/local/lib/libaddress_sorting.a
../bin/GateServer: /usr/local/lib/libupb.a
../bin/GateServer: GateServer/src/CMakeFiles/GateServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zcw/wenchat/MyChat/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX executable ../../../bin/GateServer"
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/GateServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
GateServer/src/CMakeFiles/GateServer.dir/build: ../bin/GateServer
.PHONY : GateServer/src/CMakeFiles/GateServer.dir/build

GateServer/src/CMakeFiles/GateServer.dir/clean:
	cd /home/zcw/wenchat/MyChat/build/GateServer/src && $(CMAKE_COMMAND) -P CMakeFiles/GateServer.dir/cmake_clean.cmake
.PHONY : GateServer/src/CMakeFiles/GateServer.dir/clean

GateServer/src/CMakeFiles/GateServer.dir/depend:
	cd /home/zcw/wenchat/MyChat/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zcw/wenchat/MyChat /home/zcw/wenchat/MyChat/GateServer/src /home/zcw/wenchat/MyChat/build /home/zcw/wenchat/MyChat/build/GateServer/src /home/zcw/wenchat/MyChat/build/GateServer/src/CMakeFiles/GateServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : GateServer/src/CMakeFiles/GateServer.dir/depend

