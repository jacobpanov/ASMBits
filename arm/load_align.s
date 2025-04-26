// Jacob Panov

// This program reads a 32-bit word from memory.
// This pointer is not necessarily 4-byte aligned, therefore the 
// function must emulate the unaligned access while only using
// aligned loads and stores.

.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer    // Load the address of the pointer into r0
    bl load             // Call the load function
    1: b 1b             // Done

.global load
load:
    push {r4}           // Save callee-saved registers
    and r1, r0, #3      // Extract the offset within the 4-byte word (r1 = r0 % 4)
    bic r0, r0, #3      // Align the pointer to the nearest 4-byte boundary (r0 = r0 & ~3)

    ldr r2, [r0]        // Load the aligned 4-byte word at r0
    ldr r3, [r0, #4]    // Load the next aligned 4-byte word at r0 + 4

    mov r4, r1          // Copy r1 to r4
    lsl r4, r4, #3      // Calculate the shift amount (r1 * 8)

    lsr r2, r2, r4      // Shift the first word right by r1 * 8 bits
    mov r4, #32         // Prepare to calculate the shift amount for the second word
    sub r4, r4, r1, lsl #3 // Calculate the shift amount (32 - r1 * 8)
    lsl r3, r3, r4      // Shift the second word left by (32 - r1 * 8) bits

    orr r0, r2, r3      // Combine the two shifted words
    pop {r4}            // Restore callee-saved registers
    bx lr               // Return the result in r0