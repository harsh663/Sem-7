#include<stdio.h>
int FMM(int a, int b ,int n)
{
	int i = 1,rem;
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
	return d;
	
}
int power(int x, int y)
{
 
    // If x^0 return 1
    if (y == 0)
        return 1;
 
    // If we need to find of 0^y
    if (x == 0)
        return 0;
 
    // For all other cases
    return x * power(x, y - 1);
}

int coprimecheck(int a, int h)
{
	int temp;
	do
	{
		temp = a%h;
		if(temp==0)
		return h;
		a = h;
		h = temp;
	}while (1);
}
int main()
{
	int p,q;
	printf("value of p:- ");
	scanf("%d",&p);
	printf("value of q:- ");
	scanf("%d",&q);
	int n;
	n = p*q;
	int func;
	int e;
	func = (p-1)*(q-1);
	printf("value of function:- %d",func);
	int gcd;
	for (int i=2;i<func;i++)
	{
		if(func!=i){
			gcd=coprimecheck(func,i);
			if(gcd==1)
			{
				if(i != p && i!=q)
				{
					printf("\nvalue of e:- %d ",i);
					e=i;
					break;
				}
			}
		}
	}
	int a1=1,b1=0,d1=func,k1=0;
	
	printf("\na\t\tb\t\td\t\tk\n");
	printf("%d\t\t%d\t\t%d\t\t%d\n",a1,b1,d1,k1);
	int a2=0,b2=1,d2=e;
	int k2 = d1/d2;
	printf("%d\t\t%d\t\t%d\t\t%d\n",a2,b2,d2,k2);
	int a3,b3,k3,d3 = 0;
	while(d3!=1)
	{
		a3 = (a1)-(a2*k2);
		b3 = (b1)-(b2*k2);
		d3 = (d1)-(d2*k2);
		k3 = d2/d3;
		printf("%d\t\t%d\t\t%d\t\t%d\n",a3,b3,d3,k3);
		a1 = a2;
		a2 = a3;
		b1 = b2;
		b2 = b3;
		d1 = d2;
		d2 = d3;
		k2 = k3;
	}
	if(b3 > func)
		b3 = b3%func;
	else if(b3 < 0)
		b3 = b3 + func;
	
	printf("value of d:- %d\n",b3);
	int m=0;
	printf("Enter the Message(int format):- ");
	scanf("%d",&m);
	int ct=0;
	printf("*************************************Encryption:-\n");
	ct = FMM(m,e,n);
	printf("Encryption of message:- %d\n",ct);
	printf("************************************Decryption:-\n");
	int msg = FMM(ct,b3,n);
	printf("Decryption of message:- %d",msg);
	
	return 0;
}