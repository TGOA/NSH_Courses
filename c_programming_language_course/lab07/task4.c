#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    int choice;
    char input[1024];
    printf("Choose an operation:\n1. Encrypt\n2. Decrypt\n");
    scanf("%d", &choice);
    getchar();
    if (choice == 1) {
        printf("Encrypt from:\n1. File\n2. String input\n");
        int sub_choice;
        scanf("%d", &sub_choice);
        getchar();

        if (sub_choice == 1) {
            printf("Enter the filename: ");
            scanf("%s", input);
            getchar();

            FILE *file = fopen(input, "r");
            if (file == NULL) {
                printf("Error: Could not open file for reading.\n");
                return 1;
            }

            char buffer[BUFFER_SIZE];
            if (fgets(buffer, 1024, file) != NULL) {
                for (int i = 0; buffer[i] != '\0'; i++) {
                    if (buffer[i] >= 'A' && buffer[i] <= 'Z') {
		      buffer[i] = ((buffer[i] - 'A' + 3) % 26) + 'A';
                    } else if (buffer[i] >= 'a' && buffer[i] <= 'z') {
                        buffer[i] = ((buffer[i] - 'a' + 3) % 26) + 'a';
                    }
                }
                printf("Encrypted content: %s\n", buffer);
            }
            fclose(file);

            file = fopen("encrypted.txt", "w");
            if (file == NULL) {
                printf("Error: Could not open file for writing.\n");
                return 1;
            }
            fputs(buffer, file);
            fclose(file);
            printf("Encrypted content saved to 'encrypted.txt'.\n");
        } else if (sub_choice == 2) {
            printf("Enter the string to encrypt: ");
            fgets(input, 1024, stdin);
            input[strcspn(input, "\n")] = 0;
            
            for (int i = 0; input[i] != '\0'; i++) {
                if (input[i] >= 'A' && input[i] <= 'Z') {
                    input[i] = ((input[i] - 'A' + 3) % 26) + 'A';
                } else if (input[i] >= 'a' && input[i] <= 'z') {
                    input[i] = ((input[i] - 'a' + 3) % 26) + 'a';
                }
            }
            printf("Encrypted string: %s\n", input);
        } else {
            printf("Invalid choice.\n");
        }
    } else if (choice == 2) {
        printf("Decrypt from:\n1. File\n2. String input\n");
        int sub_choice;
        scanf("%d", &sub_choice);
        getchar();

        if (sub_choice == 1) {
            printf("Enter the filename: ");
            scanf("%s", input);
            getchar();

            FILE *file = fopen(input, "r");
            if (file == NULL) {
                printf("Error: Could not open file for reading.\n");
                return 1;
            }

            char buffer[1024];
            if (fgets(buffer, 1024, file) != NULL) {
                for (int i = 0; buffer[i] != '\0'; i++) {
                    if (buffer[i] >= 'A' && buffer[i] <= 'Z') {
                        buffer[i] = ((buffer[i] - 'A' - 3 + 26) % 26) + 'A';
                    } else if (buffer[i] >= 'a' && buffer[i] <= 'z') {
                        buffer[i] = ((buffer[i] - 'a' - 3 + 26) % 26) + 'a';
                    }
                }
                printf("Decrypted content: %s\n", buffer);
            }
            fclose(file);
        } else if (sub_choice == 2) {
            printf("Enter the string to decrypt: ");
            fgets(input, BUFFER_SIZE, stdin);
            input[strcspn(input, "\n")] = 0;
            for (int i = 0; input[i] != '\0'; i++) {
                if (input[i] >= 'A' && input[i] <= 'Z') {
                    input[i] = ((input[i] - 'A' - 3 + 26) % 26) + 'A';
                } else if (input[i] >= 'a' && input[i] <= 'z') {
                    input[i] = ((input[i] - 'a' - 3 + 26) % 26) + 'a';
                }
            }
            printf("Decrypted string: %s\n", input);
        } else {
            printf("Invalid choice.\n");
        }
    } else {
        printf("Invalid choice.\n");
    }

    return 0;
}
