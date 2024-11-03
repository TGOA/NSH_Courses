#include <stdio.h>

int main() {
    float distance, time;
    char mode;
    
    
    printf("Please enter the distance from source to destination (Km): ");
    scanf("%f", &distance);
    
    
    printf("Please enter the transport mean ('W' for walking, 'C' for car, 'B' for bicycle): ");
    scanf(" %c", &mode);
        
    if (mode == 'W') {
        time = distance / 5.0;
    } else if (mode == 'B') {
        time = distance / 18.0; 
    } else if (mode == 'C') {
        time = distance / 60.0;
    } else {
        printf("invalid input.\n");
        return 1; 
    }
    
    printf("It will take around %.6f Hours\n", time);
    
    return 0;
}
