#include <stdio.h>

int main() {
    int N;
    int a = 0, e = 0, i = 0, o = 0, u = 0, other = 0;
    char ch;

    printf("Enter the number of characters: ");
    scanf("%d", &N);

    for (int j = 0; j < N; j++) {
        printf("Enter character %d: ", j + 1);
        scanf(" %c", &ch);

        switch (ch) {
            case 'a':
                a++;
                break;
            case 'e':
                e++;
                break;
            case 'i':
                i++;
                break;
            case 'o':
                o++;
                break;
            case 'u':
                u++;
                break;
            default:
                other++;
                break;
        }
    }

    printf("Frequency of 'a': %d\n", a);
    printf("Frequency of 'e': %d\n", e);
    printf("Frequency of 'i': %d\n", i);
    printf("Frequency of 'o': %d\n", o);
    printf("Frequency of 'u': %d\n", u);
    printf("Frequency of other characters: %d\n", other);

    return 0;
}
