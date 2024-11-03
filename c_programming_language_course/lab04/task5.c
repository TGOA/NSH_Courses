#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int image[10][10][3];
    float grayscale[10][10];

   
    srand(time(0));
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            image[i][j][0] = rand() % 257; 
            image[i][j][1] = rand() % 257; 
            image[i][j][2] = rand() % 257;
            grayscale[i][j] = 0.299 * image[i][j][0] + 0.587 * image[i][j][1] + 0.114 * image[i][j][2];
        }
    }
    printf("Original RGB values:\n");
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            printf("Pixel (%d, %d) - R: %d, G: %d, B: %d\n", i, j, image[i][j][0], image[i][j][1], image[i][j][2]);
        }
    }
    printf("Grayscale values:\n");
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            printf("Pixel (%d, %d) - Grayscale: %.2f\n", i, j, grayscale[i][j]);
        }
    }

    return 0;
}
