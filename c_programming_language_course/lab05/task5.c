#include <stdio.h>

void matrix_vector_multiplication(int rows, int cols, int a[rows][cols], int x[cols], int y[rows]) {
    for (int i = 0; i < rows; i++) {
        y[i] = 0; 
        for (int j = 0; j < cols; j++) {
            int product = a[i][j] * x[j]; 
            y[i] += product; 
        }
    }
}
int main() {
    int rows, cols;
    printf("Enter the number of rows and columns of the first matrix : ");
    scanf("%d %d", &rows, &cols);
    int a[rows][cols];
    int x[cols];
    int y[rows];
    printf("Enter the elements of matrix A:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            scanf("%d", &a[i][j]);
        }
    }
    printf("Enter the elements of vector x:\n");
    for (int i = 0; i < cols; i++) {
        scanf("%d", &x[i]);
    }
    matrix_vector_multiplication(rows, cols, a, x, y);
    printf("Resul of vector y:\n");
    for (int i = 0; i < rows; i++) {
        printf("%d\n", y[i]);
    }
    return 0;
}
