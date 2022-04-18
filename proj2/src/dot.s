.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
#
# If the length of the vector is less than 1, 
# this function exits with error code 5.
# If the stride of either vector is less than 1,
# this function exits with error code 6.
# =======================================================
dot:

    # Prologue
    addi sp, sp, -4
    sw s0, 0(sp)
    # check validation
    ble a2, x0, length_error
    ble a3, x0, stride_error
    ble a4, x0, stride_error

    # calculate offset
    li t0, 4
    mul t1, a3, t0
    mul t2, a4, t0

    li t0, 0 # i = 0
    li s0, 0 # sum = 0

loop_start:    
    
    bge t0, a2, loop_end
    lw t5, 0(a0)
    lw t6, 0(a1)
    mul t5, t5, t6
    add s0, s0, t5
    addi t0, t0, 1
    add a0, a0, t1
    add a1, a1, t2
    j loop_start

loop_end:

    mv a0, s0
    # Epilogue
    lw s0, 0(sp)
    addi sp, sp, 4
    
    ret

length_error:
    li a1, 5
    j exit2

stride_error:
    li a1, 6
    j exit2