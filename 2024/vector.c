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

int32_t matrix[ROWS][COLS * 2] = {
    {7, 7, 8, 3},
    {9, 6, 1, 1},
    {10, 3, 5, 0},
    {5, 8, 6, 4}};

float result[ROWS][COLS * 2];

//int32_t temp[COLS * 2];

int32_t scalar;
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

    // memcpy(&temp, &matrix[i], (COLS*2)*sizeof(uint32_t));

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
	uint32x4_t temp;
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j= j+4)
        {
            vec = vld1q_u32(matrix[i] + j);
            temp = vshlq_n_u32(vec, 8);
            vst1q_u32(matrix[i] + j, temp);
//            matrix[i][j] = matrix[i][j] << 8;
        }
    }
}

void normalize()
{
    printf("----------RESULT---------\n");

    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j++)
        {
            result[i][j] = ((float)matrix[i][j]) / 256;
            printf("%10.2f", result[i][j]);
        }
        printf("\n");
    }
}

void belowDiagonal()
{
    // zeroes out all values below the identity line
    for (j = 0; j < COLS - 1; j++)
    {
        for (i = j + 1; i < ROWS; i++)
        {
            scalar = (matrix[i][j] << SCALE) / matrix[j][j];

            for (k = 0; k < ROWS; k++)
            {
                matrix[i][k] = matrix[i][k] << SCALE;

                matrix[i][k] -= matrix[j][k] * scalar;

                matrix[i][k] = matrix[i][k] >> SCALE;

                matrix[i][k + COLS] = matrix[i][k + COLS] << SCALE;

                matrix[i][k + COLS] -= matrix[j][k + COLS] * scalar;

                matrix[i][k + COLS] = matrix[i][k + COLS] >> SCALE;

                //matrix[i][k + COLS] -= matrix[j][k + COLS] * scalar;
            }
        }
    }
}

void setOnes()
{
    // divide out leading coefficiants to set identity line to 1

    int32x4_t vec_row;
    int32x4_t temp;
    for (i = 0; i < ROWS; i++)
    {
        scalar = matrix[i][i];
        for (j = 0; j < COLS * 2; j = j + 4)
        {
	    vec_row = vld1q_s32(matrix[i] + j);
	    vec_row = vshlq_n_s32 (vec_row, 8);
	    //vec_row = vmulq_n_s32 (temp, 1/scalar);


	    vst1q_s32(matrix[i] + j, vec_row);
            //matrix[i][j] = (matrix[i][j] << 8) / scalar;
            //matrix[i][j] = matrix[i][j] ;
        }
    }
}

void aboveDiagonal()
{
    // remove numbers above pivot
    //
    


    for (i = ROWS - 1; i > 0; i--)
    {
        for (k = i - 1; k > -1; k--)
        {
            scalar = (matrix[k][i] << SCALE)/matrix[i][i];
            for (j = 0; j < COLS * 2; j++)
            {
                matrix[k][j] = matrix[k][j] << SCALE;
                matrix[k][j] -= matrix[i][j] * scalar;
                matrix[k][j] = matrix[k][j] / 256;
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
