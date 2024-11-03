#include <stdio.h>

int main() {
    int n;
    printf("Enter the number of rows: ");
    scanf("%d", &n);

       for (int i = 1; i <= n; i++) {
        for (int j = 0; j < n - i; j++) {
            printf(" ");
        }
        for (int k = 0; k < i; k++) {
            printf("*");
        }
        printf("\n");
    }

    printf("While loop version:\n");

    int i = 1;
    while (i <= n) {
        int j = 0;
        while (j < n - i) {
            printf(" ");
            j++;
        }

        int k = 0;
        while (k < i) {
            printf("*");
            k++;
        }

        printf("\n");
        i++;
    }

    return 0;
}
