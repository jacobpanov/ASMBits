// Jacob Panov

// This program converts one unsigned 32-bit audio samble to unsigned 8-bit format.
// The least-significant 24 bits of the sample are lost without any rounding.

.global _start
_start:
    ldr r0, =0x12345678
    bl shift
    b _start        // End of testing code

shift:
    lsr r0, r0, #24  // Shift right by 24 bits
    bx lr           // Return to the caller
	