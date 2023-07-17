#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include <openssl/sha.h>
#include "main.h"
#define SERV_PORT 7069
int listenSD, clientSD, noOfBytesRead = 0, choice;
struct sockaddr_in servAddr, clientAddr;
UserLoginData userLogin;
UserData user, tmp;
unsigned char hashPassword[SHA_DIGEST_LENGTH];
int compare(unsigned char *s1, unsigned char *s2)
{
    for (int i = 0; i < SHA_DIGEST_LENGTH; i++)
    {
        if (s1[i] != s2[i])
            return 0;
    }
    return 1;
}
void processClient(int clientSD)
{
    while ((noOfBytesRead = read(clientSD, &choice, sizeof(choice))) > 0)
    {
        printf("\nUser selected choice: %d.\n", choice);
        if (choice == 1)
        {
            if ((noOfBytesRead = read(clientSD, &user, sizeof(user))) > 0)
            {
                printf("\nServer recieved following data:\n");
                printf("\tUsername : %s\n\tPassword : %s\n\tName : %s.\n\tAge : %d\n",user.username, user.password, user.name, user.age);
                SHA1(user.password, strlen(user.password), hashPassword);
                printf("\t\tHashed Password: ");
                for (int i = 0; i < SHA_DIGEST_LENGTH; i++)
                    printf("%x", hashPassword[i]);
                printf("\n");
                strcpy(user.password, hashPassword);
                FILE *file = fopen("UserDB.txt", "a+");
                fwrite(&user, sizeof(user), 1, file);
                fclose(file);
                char response[100];
                memset(response, 0, sizeof(response));
                strcpy(response, "Record sucessfully stored");
                write(clientSD, &response, strlen(response));
            }
        }
        else
        {
            if ((noOfBytesRead = read(clientSD, &userLogin, sizeof(userLogin))) > 0)
            {
                printf("\nServer recieved following data:\n");
                printf("\tUsername : %s\n\tPassword : %s\n", userLogin.username, userLogin.password);
                SHA1(userLogin.password, strlen(userLogin.password), hashPassword);
                printf("\t\tHashed Password: ");
                for (int i = 0; i < SHA_DIGEST_LENGTH; i++)
                    printf("%x", hashPassword[i]);
                printf("\n");
                FILE *file = fopen("UserDB.txt", "r");
                int flag = 0;
                char response[100];
                memset(response, 0, sizeof(response));
                while (fread(&tmp, sizeof(tmp), 1, file))
                {
                    if (compare(tmp.password, hashPassword) && !strcmp(tmp.username, userLogin.username))
                    {
                        printf("\t\tRecord Found in DB.\n");
                        sprintf(response, "Welcome %s. Your name: %s. Your Age: %d.", tmp.username, tmp.name, tmp.age);
                        write(clientSD, &response, strlen(response));
                        flag = 1;
                        break;
                    }
                }
                fclose(file);
                if (!flag)
                {
                    strcpy(response, "Either Username or Password not matched.");
                    write(clientSD, &response, strlen(response));
                }
            }
        }
        printf("\nServer have data of User until now: \n");
        FILE *rfile = fopen("UserDB.txt", "r");
        while (fread(&tmp, sizeof(tmp), 1, rfile))
        {
            printf("\t\tUsername : %s.\tName : %s.\tAge : %d.\n", tmp.username, tmp.name, tmp.age);
        }
        fclose(rfile);
    }
}
int main()
{
    if ((listenSD = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        printf("Error: Socket creation not allowed.\n");
        return -1;
    }
    bzero(&servAddr, sizeof(servAddr));
    servAddr.sin_family = AF_INET;
    servAddr.sin_port = htons(SERV_PORT);
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    if (bind(listenSD, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0)
    {
        printf("Error: Socket not bind for server.\n");
        return -1;
    }
    if (listen(listenSD, 5) < 0)
    {
        printf("Error: Socket not available for listening.\n");
        return -1;
    }
    while (1)
    {
        clientSD = accept(listenSD, (struct sockaddr *)NULL, NULL);
        if (fork() == 0)
        {
            close(listenSD);
            processClient(clientSD);
            close(clientSD);
            return 0;
        }
        close(clientSD);
    }
    return 0;
}