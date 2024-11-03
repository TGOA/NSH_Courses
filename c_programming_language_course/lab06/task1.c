#include <stdio.h>
#include <stdlib.h>

int main() {
    int size, a, b;

    printf("Enter the size of the vectors: ");
    scanf("%d", &size);

    int *x = malloc(size * sizeof(int));
    int *y = malloc(size * sizeof(int));
    int *z = malloc(size * sizeof(int));

    if (x == NULL || y == NULL || z == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    printf("Enter the value of a: ");
    scanf("%d", &a);
    printf("Enter the value of b: ");
    scanf("%d", &b);

    printf("Enter elements of vector x:\n");
    for (int i = 0; i < size; i++) {
        printf("x[%d]: ", i);
        scanf("%d", &x[i]);
    }

    printf("Enter elements of vector y:\n");
    for (int i = 0; i < size; i++) {
        printf("y[%d]: ", i);
        scanf("%d", &y[i]);
    }

    for (int i = 0; i < size; i++) {
        z[i] = a * x[i] + b * y[i];
    }

    printf("Result vector z = ");
    for (int i = 0; i < size; i++) {
        printf("%d ", z[i]);
    }
    printf("\n");

    free(x);
    free(y);
    free(z);

    return 0;
}
