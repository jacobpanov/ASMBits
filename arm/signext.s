// Jacob Panov

// This program will sign-extend an 8-bit input number to 32 bits.
// The upper 24 bits of the input number should be ignored.

.global _start
_start:
    mov r0, #0xf0    // First parameter is always in r0
    bl signext
    b _start         // End of testing code

signext:
    and r0, r0, #0xFF    // Mask the upper 24 bits to isolate the 8-bit input
    lsl r0, r0, #24       // Shift the 8-bit number to the most significant byte
    asr r0, r0, #24       // Arithmetic shift right to sign-extend back to 32 bits
    bx lr                 // Return to the caller