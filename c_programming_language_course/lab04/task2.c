#include <stdio.h>

int main () {
  int n;
  printf("Enter the number of Minutes: ");
  scanf("%d",&n);
  printf("M:S\n");

  for (int i = 0; i < n*60; i++) {
    
    if (i/60 < 10 && i % 60 < 10)
      printf("0%d:0%d\n", i / 60, i % 60);
    else if (i / 60 < 10 && i % 60 > 10)
      printf("0%d:%d\n", i / 60, i % 60 );
    else if (i / 60 > 10 && i % 60 > 10)
       printf("0%d:%d\n", i / 60, i % 60 );
    else if (i / 60 > 10 && i % 60 > 10)
       printf("0%d:%d\n", i / 60, i % 60 );
    
  }

}
