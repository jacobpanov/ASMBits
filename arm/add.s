// Jacob Panov

// This function returns the sum of its two parameters.
// The parameters are two 32-bit integers.

.global _start
_start:
    mov r0, #1  // First function parameter is always passed through r0.
    mov r1, #1  // Second function parameter is always passed through r1.
    bl add      // Return value is always in r0.
    1: b 1b     // Done

.global add
add:
    add r0, r0, r1  // Add the two parameters
    bx lr           // Return to the caller
	