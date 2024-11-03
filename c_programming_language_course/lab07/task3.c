#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *inputFile = fopen("bitstream1.bit", "r");
    FILE *outputFile = fopen("bitstream.hex", "w");

    if (inputFile == NULL || outputFile == NULL) {
        printf("COULD NOT OPEN THE FILE\n");
        return 1;
    }

    char bit;
    unsigned char byte = 0;
    int bitCount = 0;

    while (fscanf(inputFile, " %c", &bit) != EOF) {
        if (bit == '0' || bit == '1') {
            byte |= (bit - '0') << bitCount;
            bitCount++;
        }
        
        if (bitCount == 8) {
            fprintf(outputFile, "%02X\n", byte);
            byte = 0;
            bitCount = 0;
        }
    }

    if (bitCount > 0) {
        fprintf(outputFile, "%02X\n", byte);
    }

    fclose(inputFile);
    fclose(outputFile);

    return 0;
}
