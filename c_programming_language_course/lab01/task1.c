#include <stdio.h>

int main(void){
  char ch;
  printf("Please enter the character:");
  scanf("%c",&ch);
  
  if (ch == 'A' || ch == 'E' || ch == 'O'|| ch == 'U' || ch == 'I'||
      ch == 'a' || ch == 'e' || ch == 'o' || ch == 'u'|| ch == 'i')
    
    {
      
      printf("It is a vowel.\n");

    }
  
  else{
      printf("It is a consonant\n");
  }



}
