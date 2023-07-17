#include<stdio.h>
#include <stdlib.h>
int main()
{
	int a,b,n,rem;
	printf("Value of a:- ");
	scanf("%d",&a);
	printf("Value of b:- ");
	scanf("%d",&b);
	printf("Value of n:- ");
	scanf("%d",&n);
	int i = 1;
	long long bin = 0;
	
	for(int j=b;j!=0;j)
    {
        rem = j % 2;
        j /= 2;
        bin += rem * i;
        i *= 10;
    }
	char str[256];
	sprintf(str, "%lld", bin);
	printf("value of b:- %s\n", str);
	
	long c=0,d=1;
	for(i =0 ; str[i]!='\0';i++);
	
	long carr[i];
	long darr[i];
	
	for(i =0 ; str[i]!='\0';i++)
	{
		c = 2*c;
		d = (d*d)%n;
		if(str[i] == '1')
		{
			c = c+1;
			d = (d*a)%n;
		}
		carr[i] = c;
		darr[i] = d;
	}
	int len1 =sizeof(carr) / sizeof(carr[0]);
	int len2 =sizeof(darr) / sizeof(darr[0]);
	printf("\nValue of c:- ");
	for(int i=0; i<len1;i++)
	{
		printf("%ld  ",carr[i]);
	}
	printf("\nValue of d:- ");
	for(int i=0; i<len2;i++)
	{
		printf("%ld  ",darr[i]);
	}
	printf("\n");
	printf("value of c:- %ld",c);
	printf("\nvalue of d:- %ld",d);
	printf("\n");
	return 0;
}