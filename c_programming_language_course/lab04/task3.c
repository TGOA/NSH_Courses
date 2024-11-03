#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main () {
  srand(time(0));
  
  int x = rand() % 10, y = rand() % 10;
  printf("x = %d\n ", x);
  printf("y = %d \n", y);
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      if (i == x && j == y) {
	printf("treasure is found: (%d,%d) ", i, j);
	break;
      }
      else
	continue; 
    }
    
  }
  
}
