#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "arm_neon.h"

int main(int argc, char *argv[]) {
    clock_t start_time;
    start_time = clock();

    float input_matrix[10][20] = {
        {1.0, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.9, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.8, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.7, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.6, 0.73, 0.73, 0.73, 0.73, 0.73, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.73, 0.5, 0.73, 0.73, 0.73, 0.73, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.4, 0.73, 0.73, 0.73, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.3, 0.73, 0.73, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.2, 0.73, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0},
        {0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.73, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
    };

    register int i = 0;
    register int j = 0;
    register int k = 0;
    register float input_norm = 0;
    register float output_norm = 0;
    

    // float to int conversion
    int int_matrix[10][20];
    for(i=9; i>=0; i--){
	for(j=19; j>=0; j--){
	    input_norm = input_norm + input_matrix[i][j];
	    int_matrix[i][j] = (int)(input_matrix[i][j] * 2048); // 2048 is the scale factor
	}
    }


    // printf("Apply Gauss-Jordan elimination\n")
    // Interchange the rows of the matrix, starting from the last row

    // create local variable so that memory only has to be accessed once per loop
    // I don't think we can use the register keyword as we would run out of registers to use
    // I removed the nested loops and replaced them with memcpy

    // possibly lots of cache misses
    int array_temp[20];
    for(i = 8; i>0; i--){
	    if(int_matrix[i][0] < int_matrix[i+1][0]){
	        memcpy(array_temp, int_matrix[i+1], 20*sizeof(int));
    	    memcpy(int_matrix[i+1], int_matrix[i], 20*sizeof(int));
	        memcpy(int_matrix[i], array_temp, 20*sizeof(int));
	    }
    }

    // This gives reduced row-echelon form
    // fliped this to decrement loops
    // made temp a local variable that is not reinitialized each loop iteration

    uint32x4_t i_vector_row;
    uint32x4_t j_vector_row;
    register int temp;

    for (i = 9; i >= 0; i--) {
	if(int_matrix[i][i] == 0){
	    printf("dividing by 0 at i=%d\n", i);
	    return 0;
	}
        for (j = 9; j >=0; j--) {
            if (j != i) {
	    temp = (int_matrix[j][i] * 2048)/ int_matrix[i][i]; // Have to ensure the scale factor remains
		for(k=0; k<20; k = k+4){ // runs 5 times		    
		    // load the vector values
		    i_vector_row = vld1q_u32(int_matrix[i] + k);
		    j_vector_row = vld1q_u32(int_matrix[j] + k);
		    // Do the multiplication
		    i_vector_row = vmulq_n_u32(i_vector_row, temp);
		    i_vector_row = vmulq_n_u32(i_vector_row, 1/2048); // have to ensure the scale factor remains
		    // vector subtraction
		    j_vector_row = vsubq_u32(j_vector_row, i_vector_row);
		    // store the vector back into the proper space		    
		    vst1q_u32(int_matrix[j] + k, j_vector_row);
		}
            }
        }
    }




    // Devide each row by the diagnal to get the inverse
    for (int i = 0; i < 10; i++) {
        int diagonal = int_matrix[i][i];
        for (int j = 0; j < 20; j++) {
            int_matrix[i][j] = (int_matrix[i][j] * 2048)/ diagonal;
        }
    }



    // convert the int matrix back to a float matrix
    // int to float conversion
    for(i=9; i>=0; i--){
	for(j=19; j>=0; j--){
	    input_matrix[i][j] = (float)(int_matrix[i][j]/2048); // 2048 is the scale factor
	    output_norm = output_norm + input_matrix[i][j];
	}
    }


   // This is just the print of the final matrix
   printf("\n\nINVERTED MATRIX\n\n");
   for (int i = 0; i < 10; i++) {
       for (int j = 10; j < 20; j++) {
           printf("%.5f ", input_matrix[i][j]);
       }
       printf("\n");
    }

    printf("matrix condition number: %.5f\n", input_norm*output_norm); 
    double time_taken = ((double)(clock()-start_time))/CLOCKS_PER_SEC;
    printf("The program took %.5f seconds to execute\n", time_taken);

    return 0;
}
