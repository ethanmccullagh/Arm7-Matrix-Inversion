#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <arm_neon.h>
#define ROWS 20
#define COLS 20
#define dCOLS COLS * 2
#define SCALE 8

void augment();
void printMatrix();
void belowDiagonal();
void setOnes();
void aboveDiagonal();
void normalize();

// align memory to reduce cache misses 
int32_t matrix[ROWS][COLS * 2]__attribute__((aligned(16))) = {
    {10 ,1 ,5 ,2 ,5 ,9 ,10 ,2 ,3 ,2 ,6 ,6 ,10 ,9 ,7 ,10 ,1 ,3 ,5 ,5},
    {7 ,2 ,7 ,3 ,2 ,1 ,7 ,5 ,10 ,9 ,2 ,9 ,9 ,3 ,9 ,3 ,3 ,4 ,10 ,10},
    {3 ,10 ,2 ,10 ,2 ,6 ,8 ,4 ,9 ,9 ,9 ,6 ,7 ,2 ,2 ,3 ,1 ,3 ,3 ,10},
    {8 ,9 ,6 ,6 ,2 ,7 ,1 ,6 ,8 ,9 ,2 ,7 ,5 ,2 ,6 ,10 ,4 ,4 ,7 ,10},
    {9 ,2 ,9 ,2 ,9 ,8 ,3 ,8 ,7 ,7 ,4 ,4 ,9 ,7 ,2 ,10 ,3 ,6 ,4 ,2},
    {7 ,10 ,1 ,10 ,5 ,5 ,2 ,6 ,7 ,3 ,3 ,3 ,9 ,5 ,6 ,2 ,8 ,3 ,10 ,1},
    {7 ,3 ,8 ,4 ,6 ,2 ,6 ,9 ,3 ,1 ,8 ,6 ,6 ,9 ,1 ,8 ,5 ,6 ,5 ,7},
    {3 ,6 ,4 ,9 ,5 ,1 ,7 ,8 ,9 ,7 ,9 ,9 ,9 ,10 ,4 ,2 ,4 ,3 ,5 ,8},
    {6 ,6 ,2 ,2 ,5 ,2 ,3 ,9 ,6 ,8 ,5 ,7 ,7 ,7 ,7 ,2 ,9 ,4 ,3 ,9},
    {10 ,5 ,6 ,1 ,1 ,7 ,7 ,10 ,10 ,2 ,9 ,2 ,8 ,3 ,9 ,10 ,1 ,9 ,5 ,9},
    {1 ,6 ,7 ,9 ,7 ,4 ,4 ,5 ,3 ,1 ,8 ,2 ,4 ,1 ,9 ,1 ,3 ,10 ,8 ,2},
    {9 ,4 ,9 ,8 ,2 ,2 ,9 ,3 ,6 ,4 ,3 ,6 ,9 ,7 ,4 ,1 ,6 ,3 ,5 ,9},
    {6 ,8 ,2 ,7 ,1 ,8 ,5 ,8 ,1 ,2 ,4 ,5 ,6 ,9 ,6 ,5 ,10 ,4 ,1 ,6},
    {2 ,1 ,1 ,2 ,8 ,10 ,9 ,8 ,1 ,9 ,2 ,8 ,1 ,9 ,10 ,4 ,1 ,6 ,3 ,9},
    {3 ,5 ,6 ,2 ,4 ,10 ,3 ,6 ,5 ,9 ,9 ,6 ,10 ,10 ,6 ,8 ,7 ,3 ,6 ,6},
    {10 ,2 ,8 ,3 ,5 ,6 ,2 ,6 ,5 ,6 ,1 ,3 ,2 ,4 ,4 ,4 ,8 ,9 ,4 ,2},
    {2 ,5 ,10 ,6 ,10 ,8 ,7 ,5 ,2 ,1 ,4 ,7 ,8 ,9 ,3 ,7 ,4 ,7 ,1 ,1},
    {7 ,5 ,7 ,2 ,2 ,1 ,7 ,3 ,4 ,7 ,3 ,4 ,6 ,1 ,1 ,1 ,8 ,10 ,6 ,6},
    {3 ,6 ,7 ,1 ,2 ,10 ,3 ,9 ,10 ,5 ,7 ,2 ,4 ,2 ,9 ,5 ,2 ,5 ,9 ,5},
    {1 ,5 ,10 ,2 ,10 ,10 ,5 ,6 ,10 ,4 ,5 ,5 ,8 ,2 ,3 ,4 ,3 ,2 ,2 ,9}};

float result[ROWS][COLS * 2];

//int32_t temp[COLS * 2];

int32_t scalar;
int32_t recipricol;
int i = 0;
int j = 0;
int k = 0;
int32x4_t vec;
int32x4_t piv;
float32x4_t flo;

int main(int argc, char *argv[])
{
    clock_t start;
    start = clock();

    // build identity matrix
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS; j++)
        {
            if (i == j)
            {
                matrix[i][j + COLS] = 1;
            }
            else
            {
                matrix[i][j + COLS] = 0;
            }
        }
    }

    printMatrix();

    augment();
    printMatrix();

    belowDiagonal();
    printMatrix();

    setOnes();
    printMatrix();


    aboveDiagonal();
    printMatrix();

    normalize();

    float runTime = (float)(clock() - start);

    printf("Runtime: %.f clock cycles\n", runTime);

    return 0;
}

void augment()
{
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j= j+4)
        {
            //loads matrix row to vector
            vec = vld1q_s32(matrix[i] + j);

            //shifts vector left by 8
            vec = vshlq_n_s32(vec, 8);

            //stores vector to matrix
            vst1q_s32(matrix[i] + j, vec);
        }
    }
}

void normalize()
{
    printf("----------RESULT---------\n");

    recipricol = (1<<16)/256;
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j++)
        {
            //vec = vld1q_s32(matrix[i]+j);
            //flo = vreinterpretq_f32_s32(vec);
            //flo = vmulq_n_f32(flo, 1/256);

            //vst1q_f32(result[i]+j, flo);

            //TODO: optomize this with vector operations
            //converting an int vector to float vector didnt seem to work
            //see above commented code

            result[i][j] = ((float)matrix[i][j])/256;
            printf("%10.2f", result[i][j]);
        }
        //for(k = 0; k < COLS*2; k++) printf("%10.2f", result[i][j]);
        printf("\n");
    }
}

void belowDiagonal()
{
    // zeroes out all values below the identity line
    //
    // traverses columns left to right
    for (j = 0; j < COLS - 1; j++)
    {
        //traverses rows top to bottom, starting from the row below [j][j]
        for (i = j + 1; i < ROWS; i++)
        {
            //calculates a scalar based on matrix[i][j] which is the value of of this row below matrix[j][j]
            scalar = (matrix[i][j] << SCALE) / matrix[j][j];

            for (k = 0; k < COLS * 2; k+=4)
            {
            
                //load vectors
                piv = vld1q_s32(matrix[j] + k);
                vec = vld1q_s32(matrix[i] + k);

                //shift selected vector left by 8
                vec = vshlq_n_s32(vec, 8);

                //multiply pivot row by scalar
                piv = vmulq_n_s32(piv, scalar);

                //subtract pivot row from selected row
                vec = vsubq_s32(vec, piv);

                //shift selected row right by 8 and store in matrix
                vec = vshrq_n_s32(vec, 8);

                vst1q_s32(matrix[i] + k, vec);
            }
        }
    }
}

void setOnes()
{
    
    for (i = 0; i < ROWS; i++)
    {
        // Compute the fixed-point reciprocal scaled by 2^16
        int32_t reciprocal = (1 << 20) / matrix[i][i]; // matrix[i][i] <<8

        for (j = 0; j < COLS * 2; j += 4)
        {
            // Load the current row into a vector
            vec = vld1q_s32(matrix[i] + j);

	    //vec_row = vshlq_n_s32 (vec_row, 8);
            // Perform the fixed-point division via multiplication with reciprocal
            vec = vmulq_n_s32 (vec, reciprocal);

            // Shift right to convert back to the original scale
            vec = vshrq_n_s32 (vec, 12);
            // Store the result back into the matrix
            vst1q_s32(matrix[i] + j, vec);
        }
    }
}


void aboveDiagonal()
{
    // remove numbers above pivoti
    //
    
    for (i = ROWS - 1; i > 0; i--)
    {
        for (k = i - 1; k > -1; k--)
        {
            scalar = (matrix[k][i] << SCALE)/matrix[i][i];
            for (j = 0; j < COLS * 2; j+=4)
            {
                //loads
                vec = vld1q_s32(matrix[k] + j);
                piv = vld1q_s32(matrix[i] + j);

                //shift selected row left and multiply pivot by scalar
                vec = vshlq_n_s32(vec, 8);
                piv = vmulq_n_s32(piv, scalar);

                //subtract pivot from selected and shift selected row right
                vec = vsubq_s32(vec, piv);
                vec = vshrq_n_s32(vec, 8);

                //store
                vst1q_s32(matrix[k] + j, vec);
//                matrix[k][j] = matrix[k][j] << SCALE;
//                matrix[k][j] -= matrix[i][j] * scalar;
//                matrix[k][j] = matrix[k][j] / 256;
            }
        }
    }
}

void printMatrix()
{
    printf("----------Matrix----------\n");
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j++)
        {
            printf("%8d", matrix[i][j]);
            if (j == COLS - 1)
                printf("  |   ");
        }
        printf("\n");
    }
}
