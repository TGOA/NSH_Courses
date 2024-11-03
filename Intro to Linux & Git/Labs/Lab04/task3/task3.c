#include <stdio.h>

int main() {
    int sum = 0; // sum is uninitialized
    double average = 0;

    // Taking average of number 1,2,3,4,5,6 :)
        for (int i = 1; i < 7; i++)
            sum = sum + i;


    average =(double) sum /(double) 6; // Calculate average
    printf("Sum = %d\n", sum);           // Print the final value of sum
    printf("Average = %f\n", average);   // Print the average
    return 0;
}
