#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
  
main()
{
    struct sockaddr_in client;
    int s, flag;
    char buffer[20];
  
    s = socket(AF_INET, SOCK_STREAM, 0);
  
    client.sin_family = AF_INET;
    client.sin_port = 2000;
    client.sin_addr.s_addr = inet_addr("127.0.0.1");
  
    connect(s, (struct sockaddr*)&client, sizeof client);
  
    for (;;) {
        printf("\nEnter a string to check palindrome: ");
        scanf("%s", buffer);
  
        printf("\nClient: %s", buffer);
        send(s, buffer, sizeof(buffer), 0);
        recv(s, &flag, sizeof(int), 0);
  
        if (flag == 1) {
            printf("\nServer: The string is a Palindrome.\n");
            break;
        }
        else {
            printf("\nServer: The string is not a palindrome.\n");
            break;
        }
    }
  
    close(s);
}
