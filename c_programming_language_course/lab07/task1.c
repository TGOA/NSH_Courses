#include <stdio.h>

typedef struct {
  char name[50];
  int id;
  float gpa;
} student;

int main() {
  int number;
  printf("Enter the number of students: ");
  scanf("%d", &number);

  student st[number];  

  for (int i = 0; i < number; i++) {
    printf("Enter ID for student %d: ", i + 1);
    scanf("%d", &st[i].id);
    printf("Enter the name of student %d: ", i + 1);
    scanf("%s", st[i].name);  
    printf("Enter the GPA of student %d: ", i + 1);
    scanf("%f", &st[i].gpa);  
  }
  for (int i = 0; i < number; i++) {
    printf("ID: %d, Name: %s, GPA: %.2f\n", st[i].id, st[i].name, st[i].gpa);  
  }

  return 0;
}
