// Jacob Panov

// This program returns the maximum values out of an array of 8-bit signed integers.

.data
Array: .byte 1, 2, 3

.text
.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

max:
    ldrsb r2, [r1], #1  // Load the first element of the array into r2 (signed byte)
    subs r0, r0, #1     // Decrement the length (r0)
    beq max_done        // If length is 1, return the first element as the max

max_loop:
    ldrsb r3, [r1], #1  // Load the next element of the array into r3 (signed byte)
    cmp r2, r3          // Compare the current max (r2) with the new element (r3)
    movlt r2, r3        // If r3 > r2, update r2 to r3
    subs r0, r0, #1     // Decrement the length (r0)
    bne max_loop        // If more elements remain, continue the loop

max_done:
    mov r0, r2          // Move the maximum value into r0 (return value)
    bx lr               // Return to the caller
	