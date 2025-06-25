// Jacob Panov

// max returns the maximum of a variable number of arguments.
// Prototype: int max(int n, ...);

.global _start
_start:
    ldr sp, =0x40000000 // Initial sp
    mov r0, #2
    mov r1, #1
    mov r2, #2

    bl max
    1: b 1b  // done

.global max
max:
    // Push register arguments so they are consecutive on the stack
    push {r0, r1, r2, r3}
    push {r4, r5, r6, r7}

    mov r4, r0                 // r4 = n
    cmp r4, #0
    beq max_zero
    add r5, sp, #20            // r5 -> first number (saved r1)
    ldr r6, [r5], #4           // r6 = current max (first number)
    subs r4, r4, #1            // remaining count

max_loop:
    cmp r4, #0
    beq max_done
    ldr r7, [r5], #4
    cmp r7, r6
    movgt r6, r7
    subs r4, r4, #1
    bne max_loop

max_done:
    mov r0, r6
    b finish

max_zero:
    mov r0, #0

finish:
    pop {r4, r5, r6, r7}
    add sp, sp, #16
    bx lr
