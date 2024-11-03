#include <stdio.h>
#include <stdlib.h>

void matrix_vector_multiplication() {
    int rows, cols;
    printf("ENter the number of rows ofthe matrix: ");
    scanf("%d", &rows);
    printf("Enter the number of columns of the matrix");
    scanf("%d", &cols);
    int **matrix = (int **)malloc(rows * sizeof(int *));
    for (int i = 0; i < rows; i++) {
        matrix[i] = (int *)malloc(cols * sizeof(int));
    }
    int *vector = (int *)malloc(cols * sizeof(int));
    int *result = (int *)malloc(rows * sizeof(int));

    printf("Enter elements of the matrix:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("matrix[%d][%d]: ", i, j);
            scanf("%d", &matrix[i][j]);
        }
    }

    printf("Enter elements of the vector:\n");
    for (int i = 0; i < cols; i++) {
        printf("vector[%d]: ", i);
        scanf("%d", &vector[i]);
    }
    for (int i = 0; i < rows; i++) {
        result[i] = 0;
        for (int j = 0; j < cols; j++) {
            result[i] += matrix[i][j] * vector[j];
        }
    }
    printf("result of matrix-vector multiplication:\n");
    for (int i = 0; i < rows; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");

    free(vector);
    free(result);
    for (int i = 0; i < rows; i++) {
        free(matrix[i]);
    }
    free(matrix);
}
void matrix_matrix_multiplication() {
    int rowsA, colsA, rowsB, colsB;
    printf("Enter the number of rows of matrix A: ");
    scanf("%d", &rowsA);
    printf("Enter the number of columns of matrix A ");
    scanf("%d", &colsA);
    printf("Enter the number of columns of matrix B: ");
    scanf("%d", &colsB);

    int **matrixA = (int **)malloc(rowsA * sizeof(int *));
    for (int i = 0; i < rowsA; i++) {
        matrixA[i] = (int *)malloc(colsA * sizeof(int));
    }
    int **matrixB = (int **)malloc(rowsB * sizeof(int *));
    for (int i = 0; i < rowsB; i++) {
        matrixB[i] = (int *)malloc(colsB * sizeof(int));
    }
    int **result = (int **)malloc(rowsA * sizeof(int *));
    for (int i = 0; i < rowsA; i++) {
        result[i] = (int *)malloc(colsB * sizeof(int));
    }

    printf("Enter elements of matrix A:\n");
    for (int i = 0; i < rowsA; i++) {
        for (int j = 0; j < colsA; j++) {
            printf("matrixA[%d][%d]: ", i, j);
            scanf("%d", &matrixA[i][j]);
        }
    }
    printf("Enter elements of matrix B:\n");
    for (int i = 0; i < rowsB; i++) {
        for (int j = 0; j < colsB; j++) {
            printf("matrixB[%d][%d]: ", i, j);
            scanf("%d", &matrixB[i][j]);
        }
    }
    for (int i = 0; i < rowsA; i++) {
        for (int j = 0; j < colsB; j++) {
            result[i][j] = 0;
            for (int k = 0; k < colsA; k++) {
                result[i][j] += matrixA[i][k] * matrixB[k][j];
            }
        }
    }
    printf("Result of matrix-matrix multiplication:\n");
    for (int i = 0; i < rowsA; i++) {
        for (int j = 0; j < colsB; j++) {
            printf("%d ", result[i][j]);
        }
        printf("\n");
    }

    for (int i = 0; i < rowsA; i++) {
        free(matrixA[i]);
    }
    free(matrixA);
    for (int i = 0; i < rowsB; i++) {
        free(matrixB[i]);
    }
    free(matrixB);
    for (int i = 0; i < rowsA; i++) {
        free(result[i]);
    }
    free(result);
}

int main() {
    char option;
    do {
        printf("1. Matrix-Vector Multiplication.\n2. Matrix-matrix multiplication. \n3. exit\n");
        printf("Enter your option: ");
        scanf(" %c", &option);
        switch (option) {
            case '1':
                matrix_vector_multiplication();
                break;
            case '2':
                matrix_matrix_multiplication();
                break;
            case 'e':
                printf("Exiting the program.\n");
                break;
            default:
                printf("Invalid option, please try again.\n");
                break;
        }
    } while (option != 'e');

    return 0;
}
