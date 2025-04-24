// Jacob Panov

// This program will accept a 32-bit signed audio sample and 
// Return a 32-bit signed sample with 1/4 of the amplitude.

.global _start
_start:
    ldr r0, =0x40000
    bl shift
    b _start        // End of testing code

// Return 1/4 amplitude for a S32 sample
shift:
    asr r0, r0, #2  // Shift right by 2 bits
    bx lr           // Return to the caller