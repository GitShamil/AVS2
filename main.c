#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>
#define size_of_array 100
extern void makeString();
char A[size_of_array];
char B[size_of_array];
int main(int argc, char *argv[]) {
    int length;
    int i;
    clock_t begin;
    clock_t end;
    double time_spent;
    FILE *input, *output;
    //if there is not second argument or second argument equels 0 we will have entering from console
    if (argc < 2 || atoi(argv[1]) == 0) {
        i = 0;
        do {
            if (i >= size_of_array) {
                printf("Incorrect length > %d\n", size_of_array);
                return 1;
            }
            A[i] = getchar();
            ++i;
        } while (A[i - 1] != EOF);
        //if second argument equels 1 we will have entering from file.
    } else if (atoi(argv[1]) == 1) {
        input = fopen("input.txt", "r");
        i = 0;
        do {
            if (i >= size_of_array) {
                printf("Incorrect length > %d\n", size_of_array);
                return 1;
            }
            A[i] = getc(input);
            ++i;
        } while (A[i - 1] != EOF);
        //if second argument equels 2 we will have random generation, and we can put third argument for seed.
    } else if (atoi(argv[1]) == 2) {
        srand(time(NULL));
        length = (abs(rand()) % 40) + 10;
        for (i = 0; i < length - 1; ++i) {
            A[i] = (abs(rand()) % 63) + 60;
        }
        A[length - 1] = EOF;
    }
    // call function that fill array B
    begin = clock();
    for (i = 0; i < 50000000; ++i) {
        makeString();
    }
    end = clock();
    time_spent = (double) (end - begin) / CLOCKS_PER_SEC;
    // if we put data from file we will have output to file
    if (argc > 1 && atoi(argv[1]) == 1) {
        output = fopen("output.txt", "w");
        fprintf(output, "time spent: %f sec\n", time_spent);
        i = 0;
        while (B[i] != EOF) {
            fprintf(output, "%c", B[i++]);
        }
        return 0;
    }
    // if we have random input of input from console we will have output to console
    printf("time spent: %f sec\n", time_spent);
    i = 0;
    while (B[i] != EOF) {
        printf("%c", B[i++]);
    }
    printf("\n");
    return 0;
}
