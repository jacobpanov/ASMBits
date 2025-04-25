// Jacob Panov

// This program will convert an unsigned 32-bit number to 16 bits.
// If the number is larger than 16 bits, it will be clamped.

.global _start
_start:
    ldr r0, =0x12345    // First parameter is always in r0
    bl saturate
    b _start            // End of testing code

saturate:
    ldr r1, =0xFFFF     // Load the maximum 16-bit value into r1
    cmp r0, r1          // Compare r0 with 0xFFFF
    movhi r0, r1        // If r0 > 0xFFFF, set r0 to 0xFFFF
    bx lr               // Return to the caller