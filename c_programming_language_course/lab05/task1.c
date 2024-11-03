#include <stdio.h>

int main () {
  int intArray[5];
  char charArray[5];

  printf("Integer Array:\n");
  for (int i = 0; i < 5; i++) {
    printf(" %p\n",&intArray[i]);
  }
  printf("Charecter Array:\n");
  for (int i = 0; i < 5; i++) {
    printf(" %p\n", &charArray[i]);

  }

}
