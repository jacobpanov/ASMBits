// Jacob Panov

// This program return the peak-to-peak amplitude of a signal.
// The signal is stored in an array of 32-bit signed words.

Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

peak:
    // r0 = length, r1 = pointer to array
    ldr r2, [r1], #4   // Load first element
    mov r3, r2         // r3 holds minimum
    mov r4, r2         // r4 holds maximum
    subs r0, r0, #1    // Decrement length (one element already read)

loop:
    cmp r0, #0
    beq done
    ldr r5, [r1], #4   // Load next element
    cmp r5, r4
    movgt r4, r5       // Update max
    cmp r5, r3
    movlt r3, r5       // Update min
    subs r0, r0, #1
    b   loop

done:
    sub r0, r4, r3     // r0 = max - min
    bx  lr             // Return to caller
