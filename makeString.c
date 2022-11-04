#include <stdio.h>
#include <stdbool.h>
extern char A[];
extern char B[];
void makeString() {
    int j = 0;
    int h = 0;
    bool read = false;
    while (A[j] != EOF) {
        if (j == 0 || (!(A[j - 1] >= 'A' && A[j - 1] <= 'Z') &&
            !(A[j - 1] >= 'a' && A[j - 1] <= 'z'))) {
            if (A[j] >= 'A' && A[j] <= 'Z') {
                read = true;
            }
        } else {
            if (!(A[j] >= 'A' && A[j] <= 'Z') &&
                !(A[j] >= 'a' && A[j] <= 'z')) {
                if (read) {
                    B[h++] = ' ';
                }
                read = false;
            }
        }
        if (read) {
            B[h++] = A[j];
        }
        ++j;
    }
    B[h] = EOF;
}
