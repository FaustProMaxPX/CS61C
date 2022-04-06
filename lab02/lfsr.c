#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

unsigned get_bit(unsigned x,
                 unsigned n) {
    // YOUR CODE HERE
    // Returning -1 is a placeholder (it makes
    // no sense, because get_bit only returns
    // 0 or 1)
    return (x >> n) & 1;
}

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    unsigned t = get_bit(*reg, 0) ^ get_bit(*reg, 2) ^ get_bit(*reg, 3) ^ get_bit(*reg, 5);
    *reg = (t << 15) | (*reg >> 1);
}

