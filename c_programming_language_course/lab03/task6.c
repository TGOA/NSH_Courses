#include <stdio.h>

int main() {
    int num, v1 = 0, v2 = 1, next;

    printf("enter the number of terms (n): ");
    scanf("%d", &num);
    printf("fibonacci series up to %d terms:\n", num);
    for (int i = 0; i < num; i++) {
        if (i == 0) {
            printf("%d, ", v1);
        } else if (i == 1) {
            printf("%d, ", v2);
        } else {
            next = v1 + v2;
            v1 = v2;
            v2 = next;
            printf("%d, ", next);
        }
    }

    return 0;
}
