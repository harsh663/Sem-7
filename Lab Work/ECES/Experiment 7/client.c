#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include "function.h"
#define SERV_PORT 7069
int main(int argc, char **argv)
{
    int connectSD, noOfBytesRead = 0;
    struct sockaddr_in servAddr;
    ll privateKey, sessionKey, message, tmp;
    publicKeyInformation client, server;
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
    printf("Enter Client Name: ");
    scanf("%s", client.name);
    printf("Enter Private Key: ");
    scanf("%llu", &privateKey);
    client.publicKey = findPublicKey(privateKey);
    printf("\nPublic key of client: < %llu >\n", client.publicKey);
    printf("Private key of client: < %llu >\n", privateKey);
    write(connectSD, &client, sizeof(client));
    if ((noOfBytesRead = read(connectSD, &server, sizeof(server))) < 0)
        return -1;
    printf("\nClient recieved Server Name: %s\n", server.name);
    printf("Client recieved Server Public Key : < %llu >\n", server.publicKey);
    sessionKey = findSessionKey(privateKey, server.publicKey);
    printf("Session Key of Client : < %llu >\n", sessionKey);
    printf("\n");
    printf("Enter -1 to close connection.\n");
    while (1)
    {
        printf("\nEnter number to send to server : ");
        scanf("%llu", &message);
        if (message == -1)
            break;
        tmp = message;
        printf("\tPlain text: %llu\n", message);
        message = encryption(message, sessionKey);
        printf("\tCipher text: %llu\n", message);
        write(connectSD, &message, sizeof(message));
        if ((noOfBytesRead = read(connectSD, &message, sizeof(message))) < 0)
            return -1;
        printf("\tServer sent to you cipher text : %llu\n", message);
        message = decryption(message, sessionKey);
        printf("\tServer sent to you double of %llu : %llu\n", tmp, message);
    }
    printf("\n");
    return 0;
}
