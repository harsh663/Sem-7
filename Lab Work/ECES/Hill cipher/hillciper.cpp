#include<stdio.h>
#include<conio.h>
#include<string.h>
void main()
{
char aa[26]="abcdefghijklmnopqrstuvwxyz";
char pt[10];
int m,d,q=0,i,j,k[2][2],p[4],pp[4],t[5];
int k1[2][2],k2[2][2],det;
//clrscr();
printf("enter the plaintext:" );
scanf("%s",pt);
m=strlen(pt);
printf("enter the numbers:");
for(i=0;i<2;i++)
{
for(j=0;j<2;j++)
{
scanf("%d",&k[i][j]);
}
}

for(i=0;i<m;i++)
{
for(j=i;j<26;j++)

{
if(pt[i]==aa[j])

{
t[q]=j%26;
++q;
}
}
}
p[0]=(k[0][0]*t[0])+(k[0][1]*t[1]);
p[1]=(k[1][0]*t[0])+(k[1][1]*t[1]);
p[2]=(k[0][0]*t[2])+(k[0][1]*t[3]);
p[3]=(k[1][0]*t[2])+(k[1][1]*t[3]);
k1[0][0]=k[1][1];
k1[0][1]=-(k[0][1]);
k1[1][0]=-(k[1][0]);
k1[1][1]=k[0][0];

det=(k1[0][0]*k1[1][1])-(k1[0][1]*k1[1][0]);
for(i=0;i<26;i++)
{
if((det*i)%26==1)
{
d=i;
}
}
for(i=0;i<2;i++)
{
for(j=0;j<2;j++)
{
k2[i][j]=(d*k1[i][j])%26;


}
}
for(i=0;i<2;i++)
{
for(j=0;j<2;j++)
{
if(k2[i][j]<0)
k2[i][j]+=26;
}
}
pp[0]=((k2[0][0]*p[0])+(k2[0][1]*p[1]))%26;
pp[1]=((k2[1][0]*p[0])+(k2[1][1]*p[1]))%26;
pp[2]=((k2[0][0]*p[2])+(k2[0][1]*p[3]))%26;
pp[3]=((k2[1][0]*p[2])+(k2[1][1]*p[3]))%26;
for(i=0;i<m;i++)
{
printf("\nThe decrypted plain text :%c",aa[pp[i]]);
}
getch();
}
