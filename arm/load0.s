// Jacob Panov

// This program reads the 32-bit word located at memory location 
// with label Data and returns it.

.global _start
_start:
    bl load
    1: b 1b    // Done
    
load:
    ldr r1, =Data // Load the address of the word 
    ldr r0, [r1]  // Load the value from the address in r0
    bx lr         // Return to the caller