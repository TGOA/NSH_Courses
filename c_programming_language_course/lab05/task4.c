#include <stdio.h>

int stringlength(char sentence[]) {
    int length = 0;
    while (sentence[length] != '\0') {
        length++;
    }
    return length;
}

int numofwords(char sentence[], int strlen) {
    int words = 0;
    for (int i = 0; i < strlen; i++) {
        if (sentence[i] == ' ' && sentence[i + 1] != ' ' && sentence[i + 1] != '\0') {
            words++;
        }
    }
    return words + 1;
}

int numofvowels(char sentence[], int strlen) {
    int vowels = 0;
    for (int i = 0; i < strlen; i++) {
        char ch = sentence[i];
        if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' || 
            ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
            vowels++;
        }
    }
    return vowels;
}

int vowelfreq(char sentence[], char vowel) {
    int frequency = 0;
    vowel = (vowel >= 'A' && vowel <= 'Z') ? vowel + 32 : vowel;  
    for (int i = 0; sentence[i] != '\0'; i++) {
        char ch = (sentence[i] >= 'A' && sentence[i] <= 'Z') ? sentence[i] + 32 : sentence[i]; 
        if (ch == vowel) {
            frequency++;
        }
    }
    return frequency;
}

int main() {
    char sentence[100];
    printf("Enter a sentence: ");
    scanf("%[^\n]s", sentence);
    int strlen = stringlength(sentence);
    printf("Length of sentence: %d\n", strlen);
    int words = numofwords(sentence, strlen);
    printf("Number of words: %d\n", words);
    int vowels = numofvowels(sentence, strlen);
    printf("Number of vowels: %d\n", vowels);
    char vowel;
    printf("Enter a vowel to find its frequency: ");
    scanf(" %c", &vowel);
    int freq = vowelfreq(sentence, vowel);
    printf("Frequency of '%c': %d\n", vowel, freq);

    return 0;
}
