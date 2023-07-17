#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>   //  Bit processing 
//#include "tables.h"

void BitsCopy(bool *DatOut,bool *DatIn,int Len);  //  Array copy 

void ByteToBit(bool *DatOut,char *DatIn,int Num); //  Byte in place 
void BitToByte(char *DatOut,bool *DatIn,int Num); //  Bit to byte

void BitToHex(char *DatOut,bool *DatIn,int Num);  //  Binary to hex 64-bit to 4*16 characters
void HexToBit(bool *DatOut,char *DatIn,int Num);  //  Hex to binary 

void TablePermute(bool *DatOut,bool *DatIn,const char *Table,int Num); //  Bit table permutation function 
void LoopMove(bool *DatIn,int Len,int Num);     //  Loop left shift Len length Num shift digits 
void Xor(bool *DatA,bool *DatB,int Num);         //  XOR function 

void S_Change(bool DatOut[32],bool DatIn[48]);   //  S box transformation 
void F_Change(bool DatIn[32],bool DatKi[48]);    //  F function                                  

void SetKey(char KeyIn[8]);                         //  Set key
void PlayDes(char MesOut[8],char MesIn[8]);       //  Perform DES encryption
void KickDes(char MesOut[8],char MesIn[8]);             //  Perform DES decryption 

 

int main()
{
    int i=0; 
    char MesHex[16]={0};         //  16-character array for storing 64-bit hexadecimal ciphertext
     char MyKey[8]={0};           //  Initial key 8 bytes * 8
    char YourKey[8]={0};         //  Enter the decryption key 8 bytes * 8
    char MyMessage[8]={0};       //  Initial plaintext 
    
/-----------------------------------------------/

    printf("Welcome! Please input your Message(64 bit):\n");
    gets(MyMessage);            //  Clear text
    printf("Please input your Secret Key:\n");
    gets(MyKey);                //  Key

    while(MyKey[i]!='\0')        //  Calculate key length
    {
        i++;
    }

    while(i!=8)                  //  Not 8 prompt error
    {
        printf("Please input a correct Secret Key!\n");
        gets(MyKey);
        i=0;
        while(MyKey[i]!='\0')    //  Detect again
        {
            i++;
        }
    }

    SetKey(MyKey);               //  Set the key to get the subkey Ki
    
    PlayDes(MesHex,MyMessage);   //  Perform DES encryption

    printf("Your Message is Encrypted!:\n");  //  Information is encrypted
    for(i=0;i<16;i++)           
    {
        printf("%c ",MesHex[i]);
    }
    printf("\n");
    printf("\n");
    
    printf("Please input your Secret Key to Deciphering:\n");  //  Please enter a key to decrypt
    gets(YourKey);                                         //  Get the key
    SetKey(YourKey);                                       //  Set key

    KickDes(MyMessage,MesHex);                     //  Decrypt output to MyMessage
    
    printf("Deciphering Over !!:\n");                     //  End of decryption
    for(i=0;i<8;i++)
    {
        printf("%c ",MyMessage[i]);
    }
    printf("\n");
    system("pause");
        
/------------------------------------------------/    
}

/*-------------------------------
   The length of the Len bit starting with DatIn
   After copying to DatOut
--------------------------------*/
void BitsCopy(bool *DatOut,bool *DatIn,int Len)     //  Array copy OK 
{
    int i=0;
    for(i=0;i<Len;i++)
    {
        DatOut[i]=DatIn[i];
    }
}

/*-------------------------------
   Byte conversion to bit function 
   Change one byte every 8 times, one bit to the right each time
   And 1 and take the last bit together with 64 bits 
--------------------------------*/
void ByteToBit(bool *DatOut,char *DatIn,int Num)       // OK
{
    int i=0;
    for(i=0;i<Num;i++)
    {
        DatOut[i]=(DatIn[i/8]>>(i%8))&0x01;   
    }                                       
}

/*-------------------------------
   Bit conversion to byte function
   Byte array is shifted every 8 times
   Bits move to the left each time with the last time or   
---------------------------------*/
void BitToByte(char *DatOut,bool *DatIn,int Num)        // OK
{
    int i=0;
    for(i=0;i<(Num/8);i++)
    {
        DatOut[i]=0;
    } 
    for(i=0;i<Num;i++)
    {
        DatOut[i/8]|=DatIn[i]<<(i%8);    
    }        
}


/*----------------------------------
   Convert binary ciphertext to hexadecimal
   Requires 16 characters to represent
-----------------------------------*/
void BitToHex(char *DatOut,bool *DatIn,int Num)
{
    int i=0;
    for(i=0;i<Num/4;i++)
    {
        DatOut[i]=0;
    }
    for(i=0;i<Num/4;i++)
    {
        DatOut[i] = DatIn[i*4]+(DatIn[i*4+1]<<1)
                    +(DatIn[i*4+2]<<2)+(DatIn[i*4+3]<<3);
        if((DatOut[i]%16)>9)
        {
            DatOut[i]=DatOut[i]%16+'7';       //    10-15 to A-F when the remainder is greater than 9
        }                                     //    Output character 
        else
        {
            DatOut[i]=DatOut[i]%16+'0';       //    Output character       
        }
    }
    
}

/*---------------------------------------------
   Hexadecimal character to binary
----------------------------------------------*/
void HexToBit(bool *DatOut,char *DatIn,int Num)
{
    int i=0;                        //  Character input 
    for(i=0;i<Num;i++)
    {
        if((DatIn[i/4])>'9')         //    Greater than 9 
        {
            DatOut[i]=((DatIn[i/4]-'7')>>(i%4))&0x01;               
        }
        else
        {
            DatOut[i]=((DatIn[i/4]-'0')>>(i%4))&0x01;     
        } 
    }    
}

//  Table replacement function OK
void TablePermute(bool *DatOut,bool *DatIn,const char *Table,int Num)  
{
    int i=0;
    static bool Temp[256]={0};
    for(i=0;i<Num;i++)                //  Num is the length of the replacement 
    {
        Temp[i]=DatIn[Table[i]-1];  //  The original data is arranged according to the position on the corresponding table 
    }
    BitsCopy(DatOut,Temp,Num);       //  Output the value of the cache Temp 
} 

//  Subkey shift
void LoopMove(bool *DatIn,int Len,int Num) //  Loop left shift Len data length Num shift digits
{
    static bool Temp[256]={0};    //  Cache OK
    BitsCopy(Temp,DatIn,Num);       //  Save the leftmost Num bit of the data (moved out) to Temp 
    BitsCopy(DatIn,DatIn+Num,Len-Num); //  Move the Num from the left of the data into the original space
    BitsCopy(DatIn+Len-Num,Temp,Num);  //  Add the data removed from the cache to the far right 
} 

//  Bitwise XOR
void Xor(bool *DatA,bool *DatB,int Num)           //  XOR function
{
    int i=0;
    for(i=0;i<Num;i++)
    {
        DatA[i]=DatA[i]^DatB[i];                  //  XOR 
    }
} 

//  Input 48 bits output 32 bits alternate with Ri
void S_Change(bool DatOut[32],bool DatIn[48])     //  S box transformation
{
    int i,X,Y;                                    //  i is 8 S boxes 
    for(i=0,Y=0,X=0;i<8;i++,DatIn+=6,DatOut+=4)   //  Input data offset 6 bits each time it is executed 
    {                                              //  Output data offset 4 bits per execution
        Y=(DatIn[0]<<1)+DatIn[5];                          //  Af stands for the first few lines
        X=(DatIn[1]<<3)+(DatIn[2]<<2)+(DatIn[3]<<1)+DatIn[4]; //  Bcde represents the first few columns
        ByteToBit(DatOut,&S_Box[i][Y][X],4);      //  Change the found point data to binary    
    }
}

//  F function
void F_Change(bool DatIn[32],bool DatKi[48])       //  F function
{
    static bool MiR[48]={0};             //  Input 32 bits change to 48 bits by E selection
    TablePermute(MiR,DatIn,E_Table,48); 
    Xor(MiR,DatKi,48);                   //  XOR with subkey
    S_Change(DatIn,MiR);                 //  S box transformation
    TablePermute(DatIn,DatIn,P_Table,32);   //  Output after P replacement
}



void SetKey(char KeyIn[8])               //  Set the key to get the subkey Ki 
{
    int i=0;
    static bool KeyBit[64]={0};                //  Key binary storage space 
    static bool *KiL=&KeyBit[0],*KiR=&KeyBit[28];  //  Top 28, last 28 total 56
    ByteToBit(KeyBit,KeyIn,64);                    //  Convert the key to binary and store it in KeyBit 
    TablePermute(KeyBit,KeyBit,PC1_Table,56);      //  PC1 table replacement 56 times
    for(i=0;i<16;i++)
    {
        LoopMove(KiL,28,Move_Table[i]);       //  The first 28 left shift 
        LoopMove(KiR,28,Move_Table[i]);          //  After 28 bits left shift 
         TablePermute(SubKey[i],KeyBit,PC2_Table,48); 
         //  Two-dimensional array SubKey[i] is the starting address of each line 
         //  PC2 replacement for each shift of the bit 
    }        
}

void PlayDes(char MesOut[8],char MesIn[8])  //  Perform DES encryption
{                                           //  Byte input Bin operation Hex output 
    int i=0;
    static bool MesBit[64]={0};        //  Plaintext binary storage space 64-bit
    static bool Temp[32]={0};
    static bool *MiL=&MesBit[0],*MiR=&MesBit[32]; //  Top 32 bits, last 32 bits 
    ByteToBit(MesBit,MesIn,64);                 //  Change the plaintext to binary and save it to MesBit
    TablePermute(MesBit,MesBit,IP_Table,64);    //  IP replacement 
    for(i=0;i<16;i++)                       //  Iteration 16 times 
    {
        BitsCopy(Temp,MiR,32);            //  Temporary storage
        F_Change(MiR,SubKey[i]);           //  F function transformation
        Xor(MiR,MiL,32);                  //  Get Ri 
        BitsCopy(MiL,Temp,32);            //  Get Li 
    }                    
    TablePermute(MesBit,MesBit,IPR_Table,64);
    BitToHex(MesOut,MesBit,64);
}

void KickDes(char MesOut[8],char MesIn[8])       //  Perform DES decryption
{                                                //  Hex input Bin operation byte output 
    int i=0;
    static bool MesBit[64]={0};        //  Ciphertext binary storage space 64-bit
    static bool Temp[32]={0};
    static bool *MiL=&MesBit[0],*MiR=&MesBit[32]; //  Top 32 bits, last 32 bits
    HexToBit(MesBit,MesIn,64);                 //  Exchange ciphertext into binary and save it to MesBit
    TablePermute(MesBit,MesBit,IP_Table,64);    //  IP replacement 
    for(i=15;i>=0;i--)
    {
        BitsCopy(Temp,MiL,32);
        F_Change(MiL,SubKey[i]);
        Xor(MiL,MiR,32);
        BitsCopy(MiR,Temp,32);
    }    
    TablePermute(MesBit,MesBit,IPR_Table,64);
    BitToByte(MesOut,MesBit,64);        
}
