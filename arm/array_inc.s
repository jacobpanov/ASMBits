// Jacob Panov

// This program increments each element in an array of integers by 1.

.data 
Array: .word 1, 2, 3, 4

.text
.global _start
_start:
    ldr r0, =Array
    mov r1, #4
    bl array_inc
    1: b 1b    // Done

.global array_inc
array_inc:
    // r0 = array pointer, r1 = number of elements
    cmp r1, #0
    beq done

loop:
    ldr r2, [r0]      // Load element
    add r2, r2, #1    // Increment
    str r2, [r0], #4  // Store and move to next element
    subs r1, r1, #1
    bne loop

done:
    bx lr
