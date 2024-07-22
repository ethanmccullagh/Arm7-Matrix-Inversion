Angus Morrison
Software Engineering
V00937482
angusmorrison@uvic.ca


Daisy Kwan
Computer Science
V00919518
daisykwan@uvic.ca

To compile and generate the assembly file in the temp partition when remote connecting to the seng440 machine
run the following code replacing the file names with the one that you wish to run.

arm-linux-gcc -S -mfloat-abi=softfp -mfpu=neon -std=c99 -o <output_file>.s <input_file>.c

To compile and generate the executable file in the temp partition when remote connecting to the seng440 machine
run the following code replacing the file names with the one that you wish to run.

arm-linux-gcc -static -std=c99 -mfloat-abi=softfp -mfpu=neon -o <output_file>.exe <input_file>.c

To run the code move the executable out of the temp partition and run the following command changing the output file
to the proper file name.

qemu-arm <output_file>.exe


To change the matricies used you will need to alter the .c file.
