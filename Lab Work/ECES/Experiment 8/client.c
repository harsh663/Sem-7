#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include "main.h"
#define SERV_PORT 7069
int main(int argc, char **argv)
{
    int connectSD, noOfBytesRead = 0, choice;
    struct sockaddr_in servAddr;
    UserData user;
    UserLoginData userLogin;
    char response[100];
    if (argc != 2)
    {
        printf("Usage: %s IP-Address\n", argv[0]);
        return -1;
    }
    if ((connectSD = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        printf("Error: Socket creation not allowed.\n");
        return -1;
    }
    bzero(&servAddr, sizeof(servAddr));
    servAddr.sin_family = AF_INET;
    servAddr.sin_port = htons(SERV_PORT);
    if (inet_pton(PF_INET, argv[1], &servAddr.sin_addr) < 0)
    {
        printf("Error: Socket not bind for server.\n");
        return -1;
    }
    if (connect(connectSD, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0)
    {
        printf("Error: Connecting to server.\n");
        return -1;
    }
    while (1)
    {
        printf("\n1. Register Yourself.\n2. Login.\n3. Exit.\nEnter Your Choice: ");
        scanf("%d", &choice);
        if (choice == 1)
        {
            printf("\nEnter Username : ");
            scanf("%s", user.username);
            getchar();
            printf("Enter Password : ");
            scanf("%s", user.password);
            getchar();
            printf("Enter Your Name : ");
            scanf("%[^\n]s", user.name);
            printf("Enter Your Age : ");
            scanf("%d", &user.age);
            write(connectSD, &choice, sizeof(choice));
            write(connectSD, &user, sizeof(user));
            if ((noOfBytesRead = read(connectSD, &response, sizeof(response))) < 0)
                return -1;
            printf("\tServer response: %s.\n", response);
        }
        else if (choice == 2)
        {
            printf("\nEnter Username : ");
            scanf("%s", userLogin.username);
            getchar();
            printf("Enter Password : ");
            scanf("%s", userLogin.password);
            write(connectSD, &choice, sizeof(choice));
            write(connectSD, &userLogin, sizeof(userLogin));
            if ((noOfBytesRead = read(connectSD, &response, sizeof(response))) < 0)
                return -1;
            printf("\tServer response: %s\n", response);
        }
        else if (choice == 3)
            break;
        else
            printf("\t\tEnter Valid choice.\n");
    }
    return 0;
}