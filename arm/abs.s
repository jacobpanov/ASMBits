// Jacob Panov

// This program returns the absolute value of its parameter.
// The parameter is a two's complement signed integer.

.global _start
_start:
    mov r0, #10
    bl abs
    1: b 1b    // Done

.global abs
abs:
    cmp r0, #0      // Compare r0 with 0
    neglt r0, r0    // If r0 < 0, negate it
    bx lr           // Return to the caller
  