#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char cmd;
    int count = 0, value;
    int *stack = (int *)malloc(1 * sizeof(int));

    if (stack == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    do {
        printf("\nEnter an option:\n'p' to push an integer.\n'o' to pop an integer.\n'd' to display the contents of the stack.\n'e' to exit the program.\n");
        scanf(" %c", &cmd);

        switch (cmd) {
            case 'p':
                printf("\nEnter an integer: ");
                scanf("%d", &value);
                stack[count] = value;
                stack = realloc(stack, (count + 1) * sizeof(int));
                count++;
                break;

            case 'o':
                stack[count] = value;
                stack = realloc(stack, (count - 1) * sizeof(int));
                count--;
                break;

            case 'd':
                printf("\ncurrent stack values:");
                for (int i = 0; i < count; i++) {
                    printf("%d ", stack[i]);
                }
                printf("\n");
                break;

            case 'e':
                printf("\nExiting the program\n");
                exit(0);
                break;

            default:
                printf("\nWrong input, try again\n");
                continue;
        }
    } while (cmd != 'e');

    return 0;
}
