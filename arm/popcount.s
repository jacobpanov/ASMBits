// Jacob Panov

// This program retuns the number of 1 bits in a given 32-bit integer.

.global _start
_start:
    mov r0, #5
    bl popcount
    1: b 1b    // Done

popcount:
    mov r1, #0  // Initialize the count to 0

loop:
    and r2, r0, #1  // Check if the least significant bit is set
    add r1, r1, r2  // Add the result to the count
    lsr r0, r0, #1  // Shift right by 1 bit
    cmp r0, #0      // Check if the input is zero
    bne loop        // If not zero, repeat

end:
    mov r0, r1      // Move the count to r0 for return
    bx lr           // Return to the caller