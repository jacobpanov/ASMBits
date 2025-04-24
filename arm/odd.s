// Jacob Panov

// This function returns whether its parameter is odd.
// Returns 1 if odd, 0 if even.

.global _start
_start:
    mov r0, #1
    bl odd
    1: b 1b    // Done

.global odd
odd:
    and r0, r0, #1  // Check if the least significant bit is set
    bx lr         // Return to the caller