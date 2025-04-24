// Jacob Panov

// This function returns the bitwise inversion of its parameter.

.global _start
_start:
    mov r0, #1
    bl invert
    1: b 1b    // Done

.global invert
invert:
    mvn r0, r0  // Invert the bits in r0
    bx lr       // Return to the caller