// Jacob Panov

// This program converts one signed 16-bit audio sample to signed 32-bit format.
// This is equivalent to increasing the amplitude by a factor of 2^16.

// A test case to test your function with

.global _start
_start:
    ldr r0, =0x1234
    bl shift
    b _start        // End of testing code

// Convert one S16 to S32 format
shift:
    lsl r0, r0, #16  // Shift left by 16 bits
    bx lr           // Return to the caller