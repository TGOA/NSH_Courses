#include <stdio.h>

int main(void) {
    int N = 0;
    float increment = 0.0;

    printf("\e[1mEnter a positive integer N:\e[m ");
    scanf("%d", &N);
    if (N <= 0) {
        printf("Error: N must be a positive integer.\n");
        return 1;
    }

    printf("Numbers from %d to 0 in descending order:\n", N);
    for (int i = N; i >= 0; i--) {
        printf("%d ", i);
    }
    printf("\n");
    printf("Numbers from 1 to %d following pattern B:\n", N);
    for (int i = 1; i <= N; i++) {
        if (i % 4 != 0) {
            printf("%d ", i);
        }
    }
    printf("\n");
    printf("\e[1mEnter an increment value less than 1:\e[m ");
    scanf("%f", &increment);
    if (increment >= 1.0) {
        printf("Error: Increment must be less than 1.\n");
        return 1;
    }

    printf("Numbers from 0 to %d with an increment of %.2f:\n", N, increment);
    for (float i = 0; i <= N; i += increment) {
        printf("%.2f ", i);
    }
    printf("\n");
    return 0;
}
