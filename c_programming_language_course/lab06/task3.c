#include <stdio.h>
#include <stdlib.h>

int main() {
    int x, sum = 0, count = 0;
    char answer;
    int *samples = (int *)malloc(sizeof(int));

    if (samples == NULL) {
        printf("Memory allocation failed.\n");
        return 1;
    }

    do {
        printf("Enter a sample integer value: ");
        scanf("%d", &x);

        samples[count] = x;
        sum += x;
        count++;

        printf("Do you want to add more samples? (y/n): ");
        scanf(" %c", &answer);

        if (answer == 'y') {
            int *temp = realloc(samples, (count + 1) * sizeof(int));
            if (temp == NULL) {
                printf("Memory reallocation failed.\n");
                free(samples);
                return 1;
            }
            samples = temp;
        }
    } while (answer == 'y');

    int average = sum / count;

    printf("You entered the following samples: ");
    for (int i = 0; i < count; i++) {
        printf("%d ", samples[i]);
        samples[i] -= average;
    }
    printf("\nCalculated average (DC value): %d\n", average);

    printf("Final adjusted samples after DC shift: ");
    for (int i = 0; i < count; i++) {
        printf("%d ", samples[i]);
    }
    printf("\n");

    free(samples);

    return 0;
}
