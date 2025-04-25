// Jacob Panov

// This program will zero-extend an 8-bit number to 32 bits.
// The upper 24 bits of the input number should be ignored.

.global _start
_start:
    ldr r0, =0xf0    // First parameter is always in r0
    bl zeroext
    b _start        // End of testing code

zeroext:
    and r0, r0, #0xFF  // Mask the upper 24 bits
    bx lr              // Return to the caller