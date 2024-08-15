#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <arm_neon.h>
#define ROWS 4
#define COLS 4
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
    {7, 7, 8, 3},
    {9, 6, 1, 1},
    {10, 3, 5, 0},
    {5, 8, 6, 4}};

float result[ROWS][COLS * 2];

//int32_t temp[COLS * 2];

int32_t scalar;
int32_t recipricol;
int i = 0;
int j = 0;
int k = 0;

int main(int argc, char *argv[])
{
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


    return 0;
}

void augment()
{
	uint32x4_t vec;
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j= j+4)
        {
            //loads matrix row to vector
            vec = vld1q_u32(matrix[i] + j);

            //shifts vector left by 8
            vec = vshlq_n_u32(vec, 8);

            //stores vector to matrix
            vst1q_u32(matrix[i] + j, vec);
        }
    }
}

void normalize()
{
    printf("----------RESULT---------\n");

    int32x4_t vec;
    float32x4_t flo;
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
    int32x4_t vec;
    int32x4_t piv;
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
    int32x4_t vec_row;
    
    for (i = 0; i < ROWS; i++)
    {
        // Compute the fixed-point reciprocal scaled by 2^16
        int32_t reciprocal = (1 << 16) / matrix[i][i];

        for (j = 0; j < COLS * 2; j += 4)
        {
            // Load the current row into a vector
            vec_row = vld1q_s32(matrix[i] + j);

	    vec_row = vshlq_n_s32 (vec_row, 8);
            // Perform the fixed-point division via multiplication with reciprocal
            vec_row = vmulq_n_s32(vec_row, reciprocal);

            // Shift right to convert back to the original scale
            vec_row = vshrq_n_s32(vec_row, 16);
            // Store the result back into the matrix
            vst1q_s32(matrix[i] + j, vec_row);
        }
    }
}


void aboveDiagonal()
{
    // remove numbers above pivot
    //
    

    int32x4_t vec;
    int32x4_t piv;
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
