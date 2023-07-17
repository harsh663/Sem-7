#include <stdio.h>
#include <sys/socket.h>
#include <unistd.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <string.h>
#include <arpa/inet.h>
#include "function.h"
#define SERV_PORT 7069
int listenSD, clientSD, noOfBytesRead = 0;
struct sockaddr_in servAddr, clientAddr;
ll privateKey, sessionKey, message;
publicKeyInformation server, client, tmp;
void processClient(int clientSD)
{
    if ((noOfBytesRead = read(clientSD, &client, sizeof(client))) > 0)
    {
        printf("\nServer recieved Client Name : %s.\n", client.name);
        printf("Server recieved Client Key : < %llu >\n", client.publicKey);
        write(clientSD, &server, sizeof(server));
        sessionKey = findSessionKey(privateKey, client.publicKey);
        printf("Session Key of Server : < %llu >\n", sessionKey);
    }
    while ((noOfBytesRead = read(clientSD, &message, sizeof(message))) > 0)
    {
        printf("\n\tServer recieved cipher text from Client: %llu.\n", message);
        message = decryption(message, sessionKey);
        printf("\tPlain text: %llu\n", message);
        printf("\tDouble of %llu : %llu\n", message, message * 2);
        message *= 2;
        message = encryption(message, sessionKey);
        printf("\tServer sent cipher text to Client: %llu.\n", message);
        write(clientSD, &message, noOfBytesRead);
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
    printf("Enter Server Name: ");
    scanf("%s", server.name);
    printf("Enter Private Key: ");
    scanf("%llu", &privateKey);
    server.publicKey = findPublicKey(privateKey);
    printf("\nPublic key of Server: < %llu >\n", server.publicKey);
    printf("Private key of Server: < %llu >\n", privateKey);
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
