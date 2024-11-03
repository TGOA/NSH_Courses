#include <stdio.h>

int main() {
    int units;
    int bill = 0;

    
    printf("Enter the number of electricity units consumed: ");
    scanf("%d", &units);

    
    if (units <= 200) {
        bill = units * 18;
    } 
    else if (units <= 250) {
        bill = (units - 200) * 78 + 3600;
    } 
    else if (units <= 350) {
        bill = (units - 250) * 60 + 7500;
    } 
    else if (units <= 400) {
        bill = (units - 350) * 110 + 10500;
    } 
    else {
        bill = (units - 400) * 140 + 16000;
    }

    
    printf("The electricity bill is: %d\n", bill);

    return 0;
}
