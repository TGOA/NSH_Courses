#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

float add_float(float x, float y) {
    return x + y;
}

float area_circle(float radius) {
    return 3.14159 * radius * radius;
}

float area_rectangle(float length, float width) {
    return length * width;
}

int factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

int main() {
    int a = 5, b = 3;
    float x = 5.5, y = 3.3;
    float radius = 4.5;
    float length = 6.0, width = 2.5;
    int num = 5;
    printf("Addition of %d and %d = %d\n", a, b, add(a, b));
    printf("Addition of %.2f and %.2f = %.2f\n", x, y, add_float(x, y));
    printf("Area of circle with radius %.2f = %.2f\n", radius, area_circle(radius));
    printf("Area of rectangle with length %.2f and width %.2f = %.2f\n", length, width, area_rectangle(length, width));
    printf("Factorial of %d = %d\n", num, factorial(num));

    return 0;
}
