#include <stdio.h>

int main() {
    int population[10], max, min, sum = 0;
    float avg;

   
    for (int i = 0; i < 10; i++) {
        printf("Enter the population of city %d: ", i + 1);
        scanf("%d", &population[i]);
    }
    
    max = min = population[0];
    
    for (int i = 0; i < 10; i++) {
        sum += population[i];
        
        if (population[i] > max) {
            max = population[i];
        }
        
        if (population[i] < min) {
            min = population[i];
        }
    }

    
    avg = (float)sum / 10;

    
    printf("\nPopulation in reverse order:\n");
    for (int i = 9; i >= 0; i--) {
        printf("Population of city %d = %d\n", i + 1, population[i]);
    }

    
    printf("\nMaximum population: %d\n", max);
    printf("Minimum population: %d\n", min);
    printf("Average population: %.2f\n", avg);

    return 0;
}
