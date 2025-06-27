// Jacob Panov

// Returns the n-th value of a linear congruential generator.

.global _start
_start:
    ldr r0, =2    // Example: compute 2nd number
    bl random
    1: b 1b    // Done

.global random
random:
    // r0 = n
    mov r1, #0          // current value (seed)
    cmp r0, #0
    beq rand_done

    ldr r2, =134775813  // multiplier
    mov r3, #1          // increment
    mov r4, #0          // temp
1:
    mul r4, r1, r2      // r4 = value * multiplier
    add r1, r4, r3      // value += increment
    subs r0, r0, #1
    bne 1b

rand_done:
    mov r0, r1
    bx lr
