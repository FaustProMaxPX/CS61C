.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    # Prologue
    


loop_start:
    add t0, x0, x0 # init i to 0
    add t1, a0, x0 # load pointer
    mv t2, a1 # load number of elements
    addi t5, x0, 1
    blt t2, t5, relu_error # if t2 < 1 loop_end
    
    







loop_continue:
    bge t0, t2, loop_end 
    mv t1, a0
    slli t3, t0, 2 # calculate offset
    add t1, t1, t3
    lw t4, 0(t1) # get the val
    bge t4, x0, increment
    sw x0, 0(t1) # store 0 into array
increment:

    # addi sp, sp, -4
    # sw a1, 0(sp)
    # mv a1, t0
    # jal print_int

    # lw a1, 0(sp)
    # addi sp, sp, 4

    addi t0, t0, 1
    j loop_continue  # jump to loop_continue
    
relu_error:
    addi a0, x0, 8

loop_end:

    # Epilogue

    
	ret