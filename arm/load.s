// Jacob Panov

// This program reads a 32-bit word located at 0x345678 and returns it.

.global _start
_start:
    ldr r0, =0x345678
    ldr r1, =123
    str r1, [r0]
    movw r0, #0xbad   // This function has no parameters.
    movw r1, #0xbad   // So destroy the value here so you won't be tempted to use it.
    bl load
    1: b 1b    // Done

.global load
load:
    ldr r1, =0x345678 // Load the address of the word 
    ldr r0, [r1]      // Load the value from the address in r0
    bx lr             // Return to the caller