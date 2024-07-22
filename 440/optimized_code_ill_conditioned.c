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
        {0.5210, 0.2770, -0.7800, -0.8460, -0.4020, 0.0720, -0.1180, 0.0740, 0.6780, 0.7200, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {-0.0320, 0.6210, -0.4590, 0.6050, 0.0970, -0.5740, 0.2770, 0.9480, -0.0490, -0.7670, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.7380, 0.5330, 0.4520, -0.6100, 0.4060, -0.7220, -0.2870, 0.0210, 0.9460, 0.5340, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {0.1720, 0.6620, -0.0280, -0.4340, 0.5270, 0.2180, 0.4360, -0.6910, 0.5140, 0.3980, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {-0.8100, -0.4900, -0.9300, 0.6610, 0.5610, -0.5540, 0.4120, -0.7760, 0.1160, -0.3240, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {-0.6310, 0.1340, -0.6170, 0.7690, 0.9430, -0.6970, -0.4370, 0.0470, -0.4510, 0.6410, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0},
        {-0.0810, 0.8070, 0.2570, -0.1030, 0.2210, -0.5140, 0.9410, -0.9570, -0.5450, -0.1360, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0},
        {-0.0820, 0.0960, 0.5470, 0.8150, 0.0960, 0.5190, -0.8170, -0.5070, 0.4970, -0.8780, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0},
        {-0.5620, -0.1510, -0.7740, -0.0330, 0.4110, -0.2620, -0.3760, -0.3970, 0.3420, 0.0580, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0},
        {-0.6780, -0.4580, -0.0560, -0.7760, -0.1210, -0.5640, -0.2390, 0.8340, 0.7550, 0.2200, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0},
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
