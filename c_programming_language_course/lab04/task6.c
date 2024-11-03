#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main() {
  srand(time(0));
  int n, m;  
  printf("Enter the number of samples M: ");
  scanf("%d", &m);
  printf("Enter moving average N: ");
  scanf("%d", &n);

  int original_array[m], smoothed_array[m];
  
  for (int i = 0; i < m; i++) {
    original_array[i] = rand() % 101;
  }
  for (int i = 0; i < m; i++) {
    if (i < n) {
      smoothed_array[i] = original_array[i];
      printf("SpeechOut%d: %d\n", i + 1, original_array[i]);
    }
    else {
      int sum = 0;
      for (int j = 0; j < n; j++) {
        sum += original_array[i - j];
      }
      int avg = sum / n;
      smoothed_array[i] = avg;
    }
  }
  printf("\nOriginal Array: ");
  for (int i = 0; i < m; i++) {
    printf("%d ", original_array[i]);
  }
  
  printf("\nSmoothed Array: ");
  for (int i = 0; i < m; i++) {
    printf("%d ", smoothed_array[i]);
  }

  return 0;
}
