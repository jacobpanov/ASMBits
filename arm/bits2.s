// Jacob Panov

// This program returns how many bits are needed to represent
// a number in signed binary representation.

.global _start
_start:
    ldr r0, =0x1000    // Example input: 0x1000
    bl bits
    b _start           // End of testing code

bits:
    cmp r0, #0          // Compare r0 with 0 to check if it's negative
    mvnlt r0, r0        // If r0 < 0 (negative), take the bitwise NOT of r0 (two's complement)
    clz r0, r0          // Count the leading zeros in the absolute value of r0
    rsb r0, r0, #33     // Subtract the number of leading zeros from 33 to account for the sign bit
    bx lr               // Return to the caller