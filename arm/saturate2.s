// Jacob Panov

// This program will convert a signed 32-bit number to 8 bits.
// If the number is larger than 8 bits, it will be clamped.

.global _start
_start:
    ldr r0, =0x123    // First parameter is always in r0
    bl saturate
    b _start          // End of testing code

// Convert signed 32-bit to 8-bit, with saturation
saturate:
    cmp r0, #0              // Check if r0 is negative
    blt neg                 // If r0 < 0, branch to neg

    cmp r0, #0x7F           // Check if r0 > 127
    movgt r0, #0x7F         // If r0 > 127, set r0 to 127
    bx lr                   // Return for positive numbers

neg:
    cmp r0, #0xFFFFFF80     // Check if r0 < -128
    movlt r0, #0x80         // If r0 < -128, set r0 to -128
    bicge r0, #0xFFFFFF00   // Clear the upper bits for valid negative numbers
    bx lr                   // Return for negative numbers