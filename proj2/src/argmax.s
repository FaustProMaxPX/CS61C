.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
#
# If the length of the vector is less than 1, 
# this function exits with error code 7.
# =================================================================
argmax:

    # Prologue


loop_start:

    mv t0, a0 # t0 -> pointer of the vector
    mv t1, a1 # t1 -> size of the vector
    add t2, x0, x0 # t2 -> index
    addi t4, x0, -1 # t4 -> current max number


loop_continue:

    bge t2, t1, loop_end
    
    lw t3, 0(t0)
    ble t3, t4, increment
    add t4, t3, x0
    addi a0, t2, 0
    
increment:
    addi t2, t2, 1
    addi t0, t0, 4 # move the pointer to the indexth element
    j loop_continue
loop_end:
    

    # Epilogue


    ret