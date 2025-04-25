// Jacob Panov

// This program will be passed a pointer to the start of an
// array of 32-bit words and an array index. 
// It will read the index-th word from memory and return it.

Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    ldr r0, =Data
    ldr r1, =1
    bl load
    1: b 1b    // Done

load:
    ldr r0, [r0, r1, lsl #2]  // Load the value from the address in r0
    bx lr                     // Return to the caller