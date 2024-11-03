#include <stdio.h>
#include "inc1/math_utils.h"
#include "inc2/string_utils.h"

int main() {
    int ab  = 0;
   int x = 5, y = 10;
   int sum = add(x, y);
   printf("Sum of %d and %d is: %d\n", x, y, sum);
   print_message("Hello from string_utils!");
   return 0;
}



