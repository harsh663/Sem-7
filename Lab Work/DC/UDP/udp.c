#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <errno.h>
#include <stdlib.h>
#include <arpa/inet.h>

static useAge(const char* proc)
{
	printf("Please enter:%s [IP] [PORT]\n",proc);
}

int main(int argc,char *argv[])
{
	struct sockaddr_in b_addr;
	
	int socked=socket(AF_INET,SOCK_DGRAM,0);
	if(socked<0)
	{
		perror("sock failed");
		return 1;
	}
	int yes=1;
	if(setsockopt(socked,SOL_SOCKET,SO_BROADCAST,&yes,sizeof(yes))<0)
	{
		perror("setsockopt failed\n");
		return 2;
	}
	
	b_addr.sin_family=AF_INET;
	b_addr.sin_addr.s_addr=inet_addr(argv[1]);
	b_addr.sin_port=htons(atoi(argv[2]));
	
	int b_addr_len=sizeof(b_addr);
	int send_len=0;
	char buf[128];
	memset(buf,'\0',128);
	stpcpy(buf,"This is a broadcase UDP!");
	send_len = sendto(socked, buf, strlen(buf), 0,(struct sockaddr *)&b_addr, b_addr_len);
        if (send_len < 0) {
                printf("\n\rsend error.\n\r");
                exit(EXIT_FAILURE);
        }
        printf("send success %d.\n\r",send_len);
	return 0;
}
