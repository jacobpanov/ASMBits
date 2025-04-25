// Jacob Panov

// This program will read a 32-bit word when given a pointer to it.

Data: .word 0x123
.global _start
_start:
    ldr r0, =Data
    bl load
    1: b 1b    // Done

// Dereference pointer
load:
    ldr r0, [r0]  // Load the value from the address in r0
    bx lr         // Return to the caller