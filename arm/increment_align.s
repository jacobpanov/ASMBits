// Jacob Panov

// This program increments a 32-bit word located in memory.
// Note that the pointer is not necessarily 4-byte aligned.
// The function must emulate the unaligned access while only using
// aligned loads and stores.

.data
.byte 0    // Test with an unaligned word.
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl inc
    1: b 1b    // Done

.global inc
inc:
    ldrb r1, [r0, #3]   // Load the last byte
    ldrb r2, [r0, #2]   // Load the second byte
    lsl r1, #8          // Shift the last byte to the left
    add r1, r2          // Add the second byte
    ldrb r2, [r0, #1]   // Load the third byte
    lsl r1, #8          // Shift the result to the left
    add r1, r2          // Add the third byte
    ldrb r2, [r0]       // Load the first byte
    lsl r1, #8          // Shift the result to the left
    add r1, r2          // Add the first byte
    add r1, #1          // Increment the result
    strb r1, [r0]       // Store the first byte
    lsr r1, #8          // Shift the result to the right
    strb r1, [r0, #1]   // Store the second byte
    lsr r1, #8          // Shift the result to the right
    strb r1, [r0, #2]   // Store the third byte
    lsr r1, #8          // Shift the result to the right
    strb r1, [r0, #3]   // Store the last byte
    bx lr               // Return