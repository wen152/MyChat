#include "GateServer.h"

int main(int argc, char *argv[]){
    if(argc != 3)
    {
        printf("Usage: ./GateServer ip port\n");
        return 0;
    }
    EventLoop loop;
    InetAddress addr(argv[1], atoi(argv[2]));
    GateServer server(&loop, addr, "GateServer");
    server.Start();
    loop.loop();
    return 0;
}