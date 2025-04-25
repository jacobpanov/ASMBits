// Jacob Panov

// This program will return the sum of its two parameters.
// The parameters and return values are both 64-bit integers.
// The first parameter will be in r0 and r1, and the second in r2 and r3.
// The result will be returned in r0 and r1.

.global _start
_start:
    mov r0, #1  // Lower 32 bits of a
    mov r1, #0  // Upper 32 bits of a
    mov r2, #1  // Lower 32 bits of b
    mov r3, #0  // Upper 32-bits of b
    bl add64
    1: b 1b    // Done

.global add64
add64:
    adds r0, r0, r2  // Add lower 32 bits of a and b
    adc r1, r1, r3  // Add upper 32 bits of a and b with carry
    bx lr           // Return to the caller