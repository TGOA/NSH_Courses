#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char input[100];
    printf("Enter a string: ");
    fgets(input, sizeof(input), stdin);
    int len = strlen(input);
    if (input[len - 1] == '\n') {
        input[len - 1] = '\0';
        len--;
    }
    char *reversed = (char *)malloc((len + 1) * sizeof(char));
    if (reversed == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    for (size_t i = 0; i < len; i++) {
        reversed[i] = input[len - i - 1];
    }
    reversed[len] = '\0'; 
    printf("Reversed string: %s\n", reversed);
    free(reversed);

    return 0;
}
