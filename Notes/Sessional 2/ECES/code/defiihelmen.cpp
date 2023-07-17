#include <iostream>
#include <cmath>
using namespace std;
int FMM(int a,int b , int n)
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
	return d;
}
int main()
{
	int ya;
	int xa=0;
	int a;
	int q;
	cout<<"value of ya:- ";
	cin>>ya;
	cout<<"value of a:- ";
	cin>>a;
	cout<<"value of q:- ";
	cin>>q;
	
	int ans=-1;
	while(ans != ya)
	{
		ans = FMM(a,xa,q);
		cout<<a<<"^"<<xa<<"%"<<q<<"=";
		cout<<ans<<endl;
		xa++;
	}
	cout<<(xa-1)<<endl;
	return 0;
}