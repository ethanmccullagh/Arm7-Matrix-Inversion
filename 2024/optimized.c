#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#define ROWS 5
#define COLS 5
#define dCOLS COLS * 2
#define SCALE 8

void augment();
void printMatrix();
void belowDiagonal();
void setOnes();
void aboveDiagonal();
void normalize();

// Try aligning the matrix data in memory to improve the cache efficiency __attribute__(aligned(16))

int32_t matrix[ROWS][COLS * 2] = {
    {7, 7, 8, 3, 2},
    {9, 6, 1, 1, 7},
    {10, 3, 5, 0, 8},
    {7, 7, 6, 4, 6},
    {3, 5, 8, 10, 3}};

float result[ROWS][COLS * 2];

//int32_t temp[COLS * 2];

int32_t scalar;
int i, j, k;

int main(int argc, char *argv[])
{

    /* can do some loop unrolling here */
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

    //can do some loop unrolling here 
    for (i = 0; i < ROWS; i++)
    {
        for (j = 0; j < COLS * 2; j++)
        {
            matrix[i][j] = matrix[i][j] << 8;
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
            //replace the division here 
            result[i][j] = ((float)matrix[i][j]) / 256;
            printf("%10.2f", result[i][j]);
        }
        printf("\n");
    }
}

void belowDiagonal()
{
    //can do some loop unrolling here
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

    for (i = 0; i < ROWS; i++)
    {
        scalar = matrix[i][i];
        for (j = 0; j < COLS * 2; j++)
        {

            //replace the division by scalar with shift and x 
            matrix[i][j] = (matrix[i][j] << 8) / scalar;
            //matrix[i][j] = matrix[i][j] ;
        }
    }
}

void aboveDiagonal()
{
    // remove numbers above pivot

    for (i = ROWS - 1; i > 0; i--)
    {
        for (k = i - 1; k > -1; k--)
        {
            scalar = (matrix[k][i] << SCALE)/matrix[i][i];
            for (j = 0; j < COLS * 2; j++)
            {
                matrix[k][j] = matrix[k][j] << SCALE;
                matrix[k][j] -= matrix[i][j] * scalar;

                // instead of this we could do (matrix[k][j] << 8) + (matrix[k][j]  to replace division here 
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