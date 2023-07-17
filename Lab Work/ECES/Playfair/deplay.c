#include <stdio.h>
#include <stdlib.h> 
#include <string.h>
#define SIZE 50
void PlayfairDeCrypt(char str[], char keystr[])
{
	char ps, ks, keyT[5][5];

	// Key
	ks = strlen(keystr);
	// ciphertext
	ps = strlen(str);

	// Convert all the characters of a string to lowercase
	// Can also use the library function toLower here, but a function was written for better understanding of ascii values.
	void toLowerCase(char plain[], int ps)
	{
		int i;
		for (i = 0; i < ps; i++) {
			if (plain[i] > 64 && plain[i] < 91)
				plain[i] += 32;
		}
	}


	// generates the 5x5 key square
	void generateKeyTable(char keystr[], int ks,
						char keyT[5][5])
	{
		int i, j, k, flag = 0, *dicty;

        // a 26 character hashmap to store count of the alphabet
		dicty = (int*)calloc(26, sizeof(int));

		for (i = 0; i < ks; i++) {
			if (keystr[i] != 'j')
				dicty[keystr[i] - 97] = 2;
		}
		dicty['j' - 97] = 1;

		i = 0;
		j = 0;
		for (k = 0; k < ks; k++) {
			if (dicty[keystr[k] - 97] == 2) {
				dicty[keystr[k] - 97] -= 1;
				keyT[i][j] = keystr[k];
				j++;
				if (j == 5) {
					i++;
					j = 0;
				}
			}
		}
		for (k = 0; k < 26; k++) {
			if (dicty[k] == 0) {
				keyT[i][j] = (char)(k + 97);
				j++;
				if (j == 5) {
					i++;
					j = 0;
				}
			}
		}
	}

	// Search for the characters of a digraph in the key square and return their position
	void search(char keyT[5][5], char a, char b, int arr[])
	{
		int i, j;

		if (a == 'j')
			a = 'i';
		else if (b == 'j')
			b = 'i';

		for (i = 0; i < 5; i++) {
			for (j = 0; j < 5; j++) {
				if (keyT[i][j] == a) {
					arr[0] = i;
					arr[1] = j;
				}
				else if (keyT[i][j] == b) {
					arr[2] = i;
					arr[3] = j;
				}
			}
		}
	}

	// Function to decrypt
	void decrypt(char str[], char keyT[5][5], int ps)
	{
		int i, a[4];
		for (i = 0; i < ps; i += 2) {
			search(keyT, str[i], str[i + 1], a);
			if (a[0] == a[2]) {
			    if(a[1]==0){
			        str[i] = keyT[a[0]][4];
			        str[i + 1] = keyT[a[0]][(a[3]-1)%5];
			    }
			    else if(a[3]==0){
			        str[i] = keyT[a[0]][(a[1] - 1)%5];
			        str[i + 1] = keyT[a[0]][4];
			    }
			    else{
			        str[i] = keyT[a[0]][(a[1] - 1)%5];
			        str[i + 1] = keyT[a[0]][(a[3]-1)%5];
			    }

			}
			else if (a[1] == a[3]) {
			    if(a[0]==0){
			        str[i] = keyT[4][a[1]];
			        str[i + 1] = keyT[(a[2]-1)%5][a[1]];
			    }
			    else if(a[2]==0){
			        str[i] = keyT[(a[0] - 1)%5][a[1]];
			        str[i + 1] = keyT[4][a[1]];
			    }
			    else{
			        str[i] = keyT[(a[0] - 1)%5][a[1]];
			        str[i + 1] = keyT[(a[2]-1)%5][a[1]];
			    }
			}
			else {
				str[i] = keyT[a[0]][a[3]];
				str[i + 1] = keyT[a[2]][a[1]];
			}
		}
	}
	

	//plain text printed in lower case letters
	printf("Plain text: %s\n", str);
}
int main()
{
	char str[SIZE], keystr[SIZE];

	//Key used - to be enered in lower case letters
	printf("Enter the key: ");
	scanf("%s", &keystr);
	printf("Key text: %s\n", keystr);


	printf("Enter the ciphertext: ");
	scanf("\n");
	scanf("%s", &str);
	printf("Cipher text: %s\n", str);

	//Calling the PlayfairDeCrypt function
	PlayfairDeCrypt(str, keystr);

	return 0;
}
