#include <stdio.h>

void axpy(int n, float a, float b, float x[], float y[], float result[]) {
    for (int i = 0; i < n; i++) {
        result[i] = a * x[i] + b * y[i];
    }
}

int main() {
    int n;
    float a, b;

    printf("Enter the size of the vectors (N): ");
    scanf("%d", &n);
    float x[n], y[n], result[n];
    printf("Enter scalar a: ");
    scanf("%f", &a);
    printf("Enter scalar b: ");
    scanf("%f", &b);

    printf("Enter elements of vector x:\n");
    for (int i = 0; i < n; i++) {
        printf("x[%d]: ", i);
        scanf("%f", &x[i]);
    }
    
    printf("Enter elements of vector y:\n");
    for (int i = 0; i < n; i++) {
        printf("y[%d]: ", i);
        scanf("%f", &y[i]);
    }
    axpy(n, a, b, x, y, result);
    printf("Result of axpy operation (ax + by):\n");
    for (int i = 0; i < n; i++) {
        printf("result[%d]: %f\n", i, result[i]);
    }

    return 0;
}
