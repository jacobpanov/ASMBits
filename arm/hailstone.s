// Jacob Panov

// Count steps for hailstone sequence to reach 1.

.global _start
_start:
    mov r0, #5
    bl hailstone
    1: b 1b

.global hailstone
hailstone:
    // r0 = starting number (>0)
    mov r1, r0      // current value
    mov r0, #0      // step counter
1:
    cmp r1, #1
    beq hs_done
    tst r1, #1
    beq even
    // odd: r1 = 3*r1 + 1
    add r1, r1, r1, lsl #1
    add r1, r1, #1
    b step
even:
    mov r1, r1, lsr #1
step:
    add r0, r0, #1
    b 1b
hs_done:
    bx lr
