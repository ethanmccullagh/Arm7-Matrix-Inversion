#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <arm_neon.h>
#define ROWS 5
#define COLS 5

void printMatrix();
void belowDiagonal();
void setOnes();
void aboveDiagonal();
void multiply();

float initial[ROWS][COLS] = {
    {7, 7, 8, 3, 2},
    {9, 6, 1, 1, 7},
    {10, 3, 5, 0, 8},
    {7, 7, 6, 4, 6},
    {3, 5, 8, 10, 3}};

float matrix[ROWS][COLS * 2];

float scalar;

int main(int argc, char *argv[])
{
    // build matrix
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS; j++)
        {
            if (j < COLS)
            {
                matrix[i][j] = initial[i][j];
            }

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
    // add identity matrix

    printMatrix();

    belowDiagonal();
    printMatrix(&matrix);

    setOnes();
    printMatrix(&matrix);

    aboveDiagonal();
    printMatrix(&matrix);


    return 0;
}

void belowDiagonal()
{
    // zeroes out all values below the identity line
    for (int column = 0; column < COLS - 1; column++)
    {
        for (int row = column + 1; row < ROWS; row++)
        {
            scalar = matrix[row][column] / matrix[column][column];

            for (int i = 0; i < ROWS; i++)
            {
                matrix[row][i] -= matrix[column][i] * scalar;
                matrix[row][i + COLS] -= matrix[column][i + COLS] * scalar;
            }
        }
    }
}

void setOnes()
{
    // divide out leading coefficiants to set identity line to 1

    for (int i = 0; i < ROWS; i++)
    {
        scalar = matrix[i][i];
        for (int j = i; j < COLS * 2; j++)
        {
            matrix[i][j] = matrix[i][j] / scalar;
        }
    }
}

void aboveDiagonal()
{
    // remove numbers above pivot

    for (int i = ROWS - 1; i > 0; i--)
    {
        for (int k = ROWS; k > i; k--)
        {
            scalar = matrix[i - 1][k - 1];
            for (int j = i; j < COLS * 2; j++)
            {
                matrix[i - 1][j] -= matrix[k - 1][j] * scalar;
            }
        }
    }
}

void multiply()
{
    float sum = 0;

    for (int i = 0; i < ROWS; i++){
        for (int j = 0; j < COLS; j++){
            for(int k = 0; k < ROWS; k++){
                sum+= initial[i][k] * matrix[k][j+COLS];
            }
            matrix[i][j] = sum;
            sum = 0;
        }
    }

    printMatrix();
}

void printMatrix()
{
    printf("----------Matrix----------\n");
    for (int i = 0; i < ROWS; i++)
    {
        for (int j = 0; j < COLS*2; j++)
        {
            printf("%8.2f", matrix[i][j]);
            if (j == COLS - 1)
                printf("  |   ");
        }
        printf("\n");
    }
}