// Jacob Panov

// This program will swap two array elements.
// The function will be passed three parameters:
// The first is a pointer to the beginning of the array.
// The second and third parameters are the indexes of the elements to swap.

Data: .word 0x123, 0x124, 0x125
.global _start
_start:
    ldr r0, =Data       // Load the address of the array into r0
    ldr r1, =0          // Index of the first element to swap
    ldr r2, =2          // Index of the second element to swap
    bl swap             // Call the swap function
    1: b 1b             // Done

swap:
    push {r4, r5, r6}   // Save callee-saved registers

    lsl r1, r1, #2      // Multiply r1 (index 1) by 4 (size of a word) to get the offset
    lsl r2, r2, #2      // Multiply r2 (index 2) by 4 (size of a word) to get the offset

    add r4, r0, r1      // Calculate the address of the first element (r4 = r0 + r1)
    add r5, r0, r2      // Calculate the address of the second element (r5 = r0 + r2)

    ldr r6, [r4]        // Load the value of the first element into r6
    ldr r1, [r5]        // Load the value of the second element into r1

    str r1, [r4]        // Store the value of the second element into the first element's position
    str r6, [r5]        // Store the value of the first element into the second element's position

    pop {r4, r5, r6}    // Restore callee-saved registers
    bx lr               // Return to the caller