#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include <math.h>
#include <arm_neon.h>

#define ROWS 5
#define COLS 5

void printMatrix();
void belowDiagonal();
void setOnes();
void aboveDiagonal();
void multiply();
float getConditionNumber( float matrix[ROWS][COLS], float inverseMatrix[ROWS][COLS]);
float findMaxAbsValue (float matrix[ROWS][COLS]);

float initial[ROWS][COLS] = {
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

    float values[25];
    float inverseMatrix[ROWS][COLS];
   

    for(int i=0; i< ROWS; i++)
    {
        for( int j = 0 ; j < COLS; j++)
        {
            inverseMatrix[i][j] = matrix[i][j+COLS];
         
        }
       
    }


    //in order to use code below need to store inverse matrix somewhere 
    printf("Invers Matrix: \n");

    for (int i = 0; i < ROWS; i++) {
        
        for (int j = 0; j < COLS; j++) {
            printf("%8.2f ", inverseMatrix[i][j]);
        }
        printf("\n");
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

