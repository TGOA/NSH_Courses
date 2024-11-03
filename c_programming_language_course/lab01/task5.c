#include <stdio.h>

int main() {
    int age, pizzasPerWeek;
    char exercise;

   
    printf("Please enter the age of the person (years): ");
    scanf("%d", &age);

    printf("Please enter how many pizzas he eats per week: ");
    scanf("%d", &pizzasPerWeek);

    printf("Please mention whether he exercises daily in the morning (Y/N): ");
    scanf(" %c", &exercise);

   
    if (pizzasPerWeek > 5) {
       
        printf("The person is 'Unfit'\n");
    } 
       
    else if (pizzasPerWeek <= 3 && exercise == 'Y') {
            printf("The person is 'Fit'\n");
        } 
     else {
       
        if (age < 30 && pizzasPerWeek <= 2) {
            printf("The person is 'Fit'\n");
        } else {
            printf("The person is 'Unfit'\n");
        }
    }

    return 0;
}
