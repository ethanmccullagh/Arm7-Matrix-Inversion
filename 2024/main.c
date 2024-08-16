#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include <math.h>

#define ROWS 10
#define COLS 10

void printMatrix();
void belowDiagonal();
void setOnes();
void aboveDiagonal();
void multiply();
float getConditionNumber( float matrix[ROWS][COLS], float inverseMatrix[ROWS][COLS]);
float findMaxAbsValue (float matrix[ROWS][COLS]);

float initial[ROWS][COLS] = {
    {9 ,3 ,2 ,5 ,3 ,7 ,4 ,3 ,2 ,2},
    {9 ,6 ,8 ,1 ,4 ,6 ,5 ,3 ,2 ,6},
    {3 ,3 ,1 ,4 ,2 ,7 ,7 ,2 ,6 ,3},
    {4 ,6 ,5 ,7 ,1 ,2 ,4 ,7 ,6 ,4},
    {2 ,8 ,7 ,5 ,9 ,6 ,3 ,10 ,10 ,5},
    {6 ,2 ,5 ,2 ,2 ,7 ,7 ,6 ,2 ,10},
    {6 ,9 ,4 ,9 ,2 ,9 ,7 ,7 ,7 ,4},
    {8 ,10 ,1 ,2 ,10 ,9 ,3 ,7 ,7 ,9},
    {2 ,10 ,1 ,6 ,6 ,9 ,6 ,3 ,2 ,9},
    {7 ,5 ,1 ,3 ,8 ,2 ,9 ,7 ,4 ,7}};

float matrix[ROWS][COLS * 2];

float scalar;

int main(int argc, char *argv[])
{
    clock_t start = clock();
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

    float inverseMatrix[ROWS][COLS];
   

    for(int i=0; i< ROWS; i++)
    {
        for( int j = 0 ; j < COLS; j++)
        {
            inverseMatrix[i][j] = matrix[i][j+COLS];
         
        }
       
    }

    float k = getConditionNumber(initial,inverseMatrix);
    printf("condition number : %f \n",k );

    float runTime = (float)(clock() - start);
    printf("Runtime: %.f cycles\n", runTime);

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


// returns the max value in a matrix
float findMaxAbsValue (float matrix[ROWS][COLS])
{
    float maxVal = fabs(matrix[0][0]);

    for(int i=0; i< ROWS; i++)
    {
        for( int j = 0; j < COLS; j++)
        {
            if(fabs(matrix[i][j]) > maxVal)
            {
                maxVal = matrix[i][j];
            }
        }
    }

    return maxVal;
}

// Returns the condition number 
float getConditionNumber( float matrix[ROWS][COLS], float inverseMatrix[ROWS][COLS])
{
    
    float matrixMaxVal = findMaxAbsValue(matrix);
    float inverseMatrixMaxVal = findMaxAbsValue(inverseMatrix);

   return matrixMaxVal * inverseMatrixMaxVal;
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

