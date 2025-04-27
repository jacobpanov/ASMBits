// Jacob Panov

// This program returns the maximum value out of an array of
// 32-bit unsigned words.

Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3          // Load the length of the array into r0
    ldr r1, =Array      // Load the address of the array into r1
    bl max              // Call the max function
    b _start            // End of testing code

.global max
max:
    ldr r2, [r1], #4    // Load the first element of the array into r2
    subs r0, r0, #1     // Decrement the length (r0)
    beq max_done        // If length is 1, return the first element as the max

max_loop:
    ldr r3, [r1], #4    // Load the next element of the array into r3
    cmp r2, r3          // Compare the current max (r2) with the new element (r3)
    movlo r2, r3        // If r3 > r2 (unsigned), update r2 to r3
    subs r0, r0, #1     // Decrement the length (r0)
    bne max_loop        // If more elements remain, continue the loop

max_done:
    mov r0, r2          // Move the maximum value into r0 (return value)
    bx lr               // Return to the caller
