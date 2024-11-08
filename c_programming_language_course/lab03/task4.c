#include <stdio.h>

int main() {
    int x, y;
    char dir;

    printf("Enter the initial coordinate for x: ");
    scanf("%d", &x);
    printf("Enter the initial coordinate for y: ");
    scanf("%d", &y);

    printf("Enter the direction from the following list:\n");
    printf("U for up, D for down, R for right, L for left\n");

    do {
        printf("\nEnter the new direction: ");
        scanf(" %c", &dir);

        switch (dir) {
            case 'U':
                y -= 1;
                break;
            case 'D':
                y += 1;
                break;
            case 'R':
                x += 1;
                break;
            case 'L':
                x -= 1;
                break;
            default:
                printf("Invalid option\n");
                break;
        }

        if (x >= 0 && x <= 5 && y >= 0 && y <= 5) {
            printf("Your current location is: (%d, %d)\n", x, y);
        }

    }
    while (x >= 0 && x <= 5 && y >= 0 && y <= 5);

    printf("\nThe player has reached the boundary at (%d, %d)\n", x, y);

    return 0;
}
