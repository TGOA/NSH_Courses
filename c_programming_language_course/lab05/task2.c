#include <stdio.h>

int main() {
    int x = 2;
    char *c = (char*)&x;

    if (*c) {
        printf("System is Little Endian\n");
    } else {
        printf("System is Big Endian\n");
    }

    if (sizeof(int *) == 4) {
        printf("System architecture: 32-bit\n");
    } else if (sizeof(void*) == 8) {
        printf("System architecture: 64-bit\n");
    } else {
        printf("Unknown system architecture\n");
    }

    return 0;
}
