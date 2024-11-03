#include <stdio.h>
#include <stdbool.h>

int main() {
    FILE *file;
    int num_lines = 0, num_words = 0, num_chars = 0;
    char buffer[1000];
    bool in_word = false;
    file = fopen("task2test.txt", "r");
    if (file == NULL) {
        printf("Error: Could not open file\n");
        return 1;
    }
    while (fgets(buffer, sizeof(buffer), file)) {
        num_lines++;
        for (int i = 0; buffer[i] != '\0'; i++) {
            num_chars++;
            if (buffer[i] == ' ' || buffer[i] == '\n' || buffer[i] == '\t') {
                if (in_word) {
                  num_words++;
                  in_word = false;
                }
            } else {
                in_word = true;
            }
        }
    }
    if (in_word) {
        num_words++;
    }
    fclose(file);
    printf("Number of lines: %d\n", num_lines);
    printf("Number of words: %d\n", num_words);
    printf("Number of characters: %d\n", num_chars);

    return 0;
}
