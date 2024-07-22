#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

float input_norm;
float output_norm;

void PrintFullMatrix(float matrix[10][20]) {    

    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 20; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

int main(int argc, char *argv[]) {
    clock_t start_time;
    start_time = clock();

    float matrix[10][20] = {
        {10, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 9, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 8, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 7, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 6, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 5, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 4, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 3, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 2, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    };

    printf("Starting the inversion\n");
    // Do the inversion
    /* Augmenting Identity Matrix of Order 10 */
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            // if i == j, we are on the diagonal, so make the identity matrix
            if (i == j) {
                matrix[i][j + 10] = 1;
            } else {
                matrix[i][j + 10] = 0;
            }
        }
    }

    for(int i = 0; i<10; i++){
	for(int j = 0; j<10; j++){
	    input_norm = input_norm + matrix[i][j];
	}
    }

    // Print the whole 10x20 matrix
    PrintFullMatrix(matrix);

    printf("Finished augmenting the identity matrix\n");

    printf("Apply Gauss-Jordan elimination\n");

    // Interchange the rows of the matrix, starting from the last row
    for (int i = 9; i > 0; i--) {
        // Swap rows
        if (matrix[i - 1][0] < matrix[i][0]) {
            float temp[20];
            for (int j = 0; j < 20; j++) {
                temp[j] = matrix[i][j];
                matrix[i][j] = matrix[i - 1][j];
                matrix[i - 1][j] = temp[j];
            }
        }
    }

    // Print matrix after interchange operations.
    printf("\nRows have been interchanged\n");
    PrintFullMatrix(matrix);

    // This gives reduced row-echelon form
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            if (j != i) {
                float temp = matrix[j][i] / matrix[i][i];
                for (int k = 0; k < 20; k++) {
                    matrix[j][k] -= matrix[i][k] * temp;
                }
            }
        }
    }

    // Devide each row by the diagnal to get the inverse
    for (int i = 0; i < 10; i++) {
        float diagonal = matrix[i][i];
        for (int j = 0; j < 20; j++) {
            matrix[i][j] /= diagonal;
        }
    }

    printf("\n\nINVERTED MATRIX\n\n");
    for (int i = 0; i < 10; i++) {
        for (int j = 10; j < 20; j++) {
	    output_norm = output_norm + matrix[i][j];
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }    

    printf("matrix condition number: %.5f\n", input_norm*output_norm); 
    double time_taken = ((double)(clock()-start_time))/CLOCKS_PER_SEC;
    printf("The program took %.5f seconds to execute\n", time_taken);

    return 0;
}
