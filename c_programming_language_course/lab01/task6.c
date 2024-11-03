#include <stdio.h>

int main() {
  double a, b, c, y;
  double x_max;
  
  printf("Enter cofficient of a:");
  scanf("%lf", &a);
  printf("Enter cofficient of b: ");
  scanf("%lf", &b);
  printf("Enter cofficient of c:");
  scanf("%lf", &c);

  x_max = -b / (2*a);
  y = a * x_max*x_max + b*x_max + c;

  printf("The extremum point is at (%.2f, %.2f)\n", x_max, y);
}
