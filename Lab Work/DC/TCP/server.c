#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
  
main()
{
    struct sockaddr_in client, server;
    int s, n, sock, g, j, left, right, flag;
    char b1[20], b2[10], b3[10], b4[10];
  
    s = socket(AF_INET, SOCK_STREAM, 0);
  
    server.sin_family = AF_INET;
  
    server.sin_port = 2000;
    server.sin_addr.s_addr = inet_addr("127.0.0.1");

    bind(s, (struct sockaddr*)&server, sizeof server);
    listen(s, 1);
    n = sizeof client;
  
    sock = accept(s, (struct sockaddr*)&client, &n);
    for (;;) {
        recv(sock, b1, sizeof(b1), 0);

        printf("\nThe string received is:%s\n", b1);
        if (strlen(b1) == 0)
            flag = 1;
        else {
            left = 0;
            right = strlen(b1) - 1;
            flag = 1;
            while (left < right && flag) {
                if (b1[left] != b1[right])
                    flag = 0;
                else {
                    left++;
                    right--;
                }
            }
        }
        send(sock, &flag, sizeof(int), 0);
        break;
    }
    close(sock);
  
    close(s);
}
