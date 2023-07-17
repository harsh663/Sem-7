#include <stdio.h>
#include <string.h>
void encrypt(int key, char* encryption, char* message) {
 	int len = strlen(message);
 	char tmp, i;
 	for (i = 0; i < len; i++) {
 		if (message[i] >= 'A' && message[i] <= 'Z') {
 			tmp = message[i] + key;
 			if (tmp > 'Z')
 				encryption[i] = tmp - 26;
 			else
 				encryption[i] = tmp;
 		}
 		else
 			encryption[i] = message[i];
 		}
 		encryption[i] = 0;
}
void decrypt(int key, char* decryption, char* message) {
 	int len = strlen(message);
 	char tmp, i;
 	for (i = 0; i < len; i++) {
 		if (message[i] >= 'A' && message[i] <= 'Z') {
 			tmp = message[i] - key;
 			if (tmp < 'A')
 				decryption[i] = tmp + 26;
 			else
 				decryption[i] = tmp;
 		}
 		else
 			decryption[i] = message[i];
 		}
 		decryption[i] = 0;
}

int main() {
 	int key, choice;
 	char message[256], encryption[256], decryption[256], ch;
 	printf("Enter key for Ceaser Cipher (1-25): ");
 	scanf("%d", &key);
 	if (key < 1 || key > 25) {
 		printf("Enter key between 1 to 25.\n");
 		return 1;
 	}
 	while (1) {
 		printf("\n1) Encryption\n2) Decryption\n3) Exit\nEnter Following Choice: ");
 		scanf("%d", &choice);
 		getchar();
 		if (choice == 3)
 			break;
 		else if (choice == 1) {
 			printf("Enter message for encryption: ");
 			scanf("%[^\n]s", message);
 			encrypt(key, encryption, message);
 			printf("Plain Text: %s\nCipher Text: %s\n", message, encryption);
 		}
 		else if (choice == 2) {
 			printf("Enter message for deryption: ");
 			scanf("%[^\n]s", message);
 			decrypt(key, decryption, message);
 			printf("Cipher Text: %s\nPlain Text: %s\n", message, decryption);
 		}
 		else
 			printf("Enter valid choice.\n");
 		}
 		return 0;
}
