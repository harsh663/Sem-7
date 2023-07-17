#include <iostream>
#include <string>
#include <ctime>
#include <stdio.h>
using namespace std;

string SDESEncryption(string, string, int);
string SDESDecryption(string, string, int);
string findKey(string, int);
string functionF(string, string);
string XOR(string, string);
string S1Box(string);
string S2Box(string);
string randomString(int);
string header();

int main()
{
	//Declare variables, use random bit strings for plaintext and key
	//User must press any key to begin the program to add a delay between
	//initializing plaintext and key so they aren't the same.
	string plaintext = randomString(12);
	cout	<< "Generating your plaintext and key pair." << endl
			<< "Please wait..." << endl;
	system("pause");
	system("CLS");
	string key = randomString(9);
	string ciphertext;
	string decryption;
	int numrounds = 4;
	int rounds;
	//Print out unnecessary header
	cout	<< header();
	//Print out original plaintext P
	cout	<< "\tOriginal Plaintext:\t" << plaintext << endl
			<< "\tKey:\t\t\t" << key << endl;
	//Do [numrounds] rounds of SDES on plaintext P ( max 4 )
	cout << "\nEncryption:\n";
	for(int i = 0; i < numrounds; i++)
	{
		plaintext = SDESEncryption(key, plaintext, i+1);
		cout << "\tC (after round " << i + 1 << "):\t" << plaintext << endl;
		rounds = i + 1;
	}
	//When you are finised, reverse the plaintext order of LnRn to RnLn for ciphertext C
	ciphertext.append(plaintext, 6, 6);
	ciphertext.append(plaintext, 0, 6);
	//Print out ciphertext
	cout	<< endl << "Ciphertext after " << rounds  << " rounds:\t" << ciphertext << endl << endl;
	//Now decrypt the ciphertext
	cout	<< "Proof by decryption:\n\n"
			<< "Ciphertext:\t" << ciphertext << endl << endl;
	//First make the ciphertext in order RnLn back to order LnRn
	decryption.append(ciphertext, 6, 6);
	decryption.append(ciphertext, 0, 6);
	//Now do [numrounds] of decryption
	for(int j = numrounds; j > 0; j--)
	{
		decryption = SDESDecryption(key, decryption, j);
		if(j != 1)
			cout << "\tC(after round " << j << "):\t" << decryption << endl;
		else if(j == 1)
			cout << "\nPlaintext after:\t\t" << decryption << endl << endl;
	}
	return 0;
}

////////////////////////////////////////////////////////////////
//SDES Encryption Function
////////////////////////////////////////////////////////////////
string SDESEncryption(string key, string plaintext, int round)
{
	//Declare variables
	string Li;
	string Ri;
	string Ln;
	string Rn;
	string K;
	string f;
	//Find the key for the round
	K = findKey(key, round);
	//Split the plaintext into initial Li and Ri
	Li.append(plaintext, 0, 6);
	Ri.append(plaintext, 6, 6);
	//Step 1: Ln = Ri
	Ln = Ri;
	//Step 2: Rn = L0 XOR f(Ri,Kround)
	//Find f(Ri, Kround)
	f.append(functionF(Ri, K));
	//Now find Rn = Li XOR f(Ri, Kround)
	Rn.append(f);
	Rn = XOR(Li, f);
	//Finish the round by concatenating  and returning Ln+Rn;
	return (Ln + Rn);
}

////////////////////////////////////////////////////////////////
//SDES Decryption Function
////////////////////////////////////////////////////////////////
string SDESDecryption(string key, string ciphertext, int round)
{
	//Declare variables
	string Li;
	string Ri;
	string Ln;
	string Rn;
	string K;
	string f;
	//Find the key for the round
	K = findKey(key, round);
	//Split the ciphertext into initial Li and Ri
	Li.append(ciphertext, 0, 6);
	Ri.append(ciphertext, 6, 6);
	//Step 1: Rn = Li
	Rn = Li;
	//Step 2: Ln = Ri XOR f(Ln, K)
	//Find f(Ln, K)
	f.append(functionF(Rn, K));
	//Now find Ln = Ri XOR f(Ln, K)
	Ln.append(f);
	Ln = XOR(Ri, f);
	//Finish the round by concatenating and returning Ln + Rn
	return (Ln + Rn);

}

////////////////////////////////////////////////////////////////
//A function to find the key based on what round it is
////////////////////////////////////////////////////////////////
string findKey(string key, int round)
{
	//Get the key for the round
	string K;
	if(round == 1)
		K.append(key, 0, 8);
	else if(round == 2)
		K.append(key, 1, 8);
	else if(round == 3)
	{
		K.append(key, 2, 7);
		K.append(key, 0, 1);
	}
	else if(round == 4)
	{
		K.append(key, 3, 6);
		K.append(key, 0, 2);
	}
	return K;
}

////////////////////////////////////////////////////////////////
//The F Function (f(Ri, Ki+1))
////////////////////////////////////////////////////////////////
string functionF(string R, string K)
{
	char tmp;
	string s1;
	string s2;
	//Expand Ri to find E(Ri)
	R.append(R, 4, 2);
	tmp = R[3];
	R[5] = R[2];
	R[4] = tmp;
	R[3] = R[2];
	R[2] = tmp;
	//XOR E(Ri) with Kround to find S-Box inputs
	R = XOR(R, K);
	s1.append(R, 0, 4);
	s2.append(R, 4, 4);
	//Find f(Ri, Kround) by concatenating S1Box(s1) + S2Box(s2)
	return S1Box(s1) + S2Box(s2);
}

////////////////////////////////////////////////////////////////
//The XOR Function
////////////////////////////////////////////////////////////////
string XOR(string x, string y)
{
	for(int i = 0; i < x.length(); i++)
	{
		if(x[i] == y[i])
			x[i] = '0';
		else if(x[i] != y[i])
			x[i] = '1';
	}
	return x;
}

////////////////////////////////////////////////////////////////
//S1-Box Function
////////////////////////////////////////////////////////////////
string S1Box(string s1)
{
	//Define S1-Box rows 1 and 2
	string row1[8] = {"101", "010", "001", "110", "011", "100", "111", "000"};
	string row2[8] = {"001", "100", "110", "010", "000", "111", "101", "011"};
	int column = 0;
	//If bits start with a 0, use row 1
	if(s1[0] == '0')
	{
		//Convert remaining 3 bits to decimal
		if(s1[1] == '1')
			column += 4;
		if(s1[2] == '1')
			column += 2;
		if(s1[3] == '1')
			column += 1;
		//Return the 3 bit pattern in the respective column
		return row1[column];
	}
	//If bits start with a 1, use row 2
	else if(s1[0] == '1')
	{
		//Convert remaining 3 bits to decimal
		if(s1[1] == '1')
			column += 4;
		if(s1[2] == '1')
			column += 2;
		if(s1[3] == '1')
			column += 1;
		//Return the 3 bit pattern in the respective column
		return row2[column];
	}
	else
		//Something went wrong (very wrong)
		return "ERROR";
}

////////////////////////////////////////////////////////////////
//S2-Box Function
////////////////////////////////////////////////////////////////
string S2Box(string s2)
{
	//Define S1-Box rows 1 and 2
	string row1[8] = {"100", "000", "110", "101", "111", "001", "011", "010"};
	string row2[8] = {"101", "011", "000", "111", "110", "010", "001", "100"};
	int column = 0;
	//If bits start with a 0, use row 1
	if(s2[0] == '0')
	{
		//Convert the remaining 3 bits to decimal
		if(s2[1] == '1')
			column += 4;
		if(s2[2] == '1')
			column += 2;
		if(s2[3] == '1')
			column += 1;
		//Return the 3 bit pattern in the respective column
		return row1[column];
	}
	//If bits start with a 1, use row 2
	else if(s2[0] == '1')
	{
		//Convert the remaining 3 bits to decimal
		if(s2[1] == '1')
			column += 4;
		if(s2[2] == '1')
			column += 2;
		if(s2[3] == '1')
			column += 1;
		//Return the 3 bit pattern in the respective column
		return row2[column];
	}
	else
		//Something went wrong (very wrong)
		return "ERROR";
}

////////////////////////////////////////////////////////////////
//Function to generate a random bit string
////////////////////////////////////////////////////////////////
string randomString(int length)
{
	//Use time as seed for PRNG
	srand(time(0));
	int randomNumber;
	string randomBit;
	string randomString;
	for(int k = 0; k < length; k++)
	{
		randomNumber = rand() % 2;
		if(randomNumber == 0)
			randomBit = "0";
		else if(randomNumber == 1)
			randomBit = "1";
		randomString.append(randomBit);
	}
	return randomString;
}

////////////////////////////////////////////////////////////////
//Function to print out header
////////////////////////////////////////////////////////////////
string header()
{
	string header = "******\t\t*****\n\t\t    SDES DEMO\t\t\t\n*****\t\t******\n";
	return header;
}
