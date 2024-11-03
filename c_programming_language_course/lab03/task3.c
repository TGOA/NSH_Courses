#include <stdio.h>

int main(){
    int ncities = 0, sum = 0, population = 0, max_population = 0, min_population = 0;
    float mean = 0.0;
    printf("\e[1mEnter the number of cities: \e[m");
    scanf("%d", &ncities);
    if (ncities <= 0){
        printf("The number of cities must be greater than 0.\n");
        return 1;
    }
    printf("\e[1mEnter the population of city 1: \e[m");
    scanf("%d", &population);
    sum += population;
    max_population = min_population = population;

    for (int i = 1; i < ncities; i++) {
        printf("\e[1mEnter the population of city %d: \e[m", i + 1);
        scanf("%d", &population);
        sum += population;
        if (population > max_population) {
            max_population = population;
        }

        if (population < min_population) {
            min_population = population;
        }
    }
    mean = (float)sum / ncities;
    printf("\e[1mMaximum population: %d\e[m\n", max_population);
    printf("\e[1mMinimum population: %d\e[m\n", min_population);
    printf("\e[1mMean population: %.2f\e[m\n", mean);

    return 0;
}
