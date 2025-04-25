// Jacob Panov

// This program returns how many bits are needed to represent
// a number in unsigned binary representation.

.global _start
_start:
    ldr r0, =0x1000    // Example input: 0x1000
    bl bits
    b _start           // End of testing code

// Return minimum number of bits to represent first parameter
bits:
    clz r1, r0         // Count leading zeros in r0, store result in r1
    rsb r0, r1, #32    // Subtract the number of leading zeros from 32
    bx lr              // Return to the caller