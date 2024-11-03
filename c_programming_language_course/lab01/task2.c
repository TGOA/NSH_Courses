#include <stdio.h>

int main() {
    int grade;
    printf("Enter the grade: ");
    scanf("%d", &grade);

    if (grade >= 0 && grade < 41) {
        printf("The grade is: F\n");
    } else if (grade >= 41 && grade <= 47) {
        printf("The grade is: D\n");
    } else if (grade > 47 && grade <= 52) {
        printf("The grade is: D+\n");
    } else if (grade > 52 && grade <= 58) {
        printf("The grade is: C\n");
    } else if (grade > 58 && grade <= 63) {
        printf("The grade is: C+\n");
    } else if (grade > 63 && grade <= 68) {
        printf("The grade is: B\n");
    } else if (grade > 68 && grade <= 73) {
        printf("The grade is: B+\n");
    } else if (grade > 73 && grade <= 100 ) {
        printf("The grade is: A\n");
    }
    else{
      printf("invalid input\n");
    }

    return 0;
}
