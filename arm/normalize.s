// Jacob Panov

// Normalize array of U32 samples to U16 range.

.data
Input: .word 0x10000, 0x20000, 0x80000, 0x4000
Output: .skip 8

.text
.global _start
_start:
    ldr r0, =4
    ldr r1, =Input
    ldr r2, =Output
    bl normalize
    b _start

// Normalize to U16
normalize:
    push {r4-r8, lr}
    mov r4, #0          // current max
    mov r5, r0          // count
    mov r6, r1          // input ptr
1:
    ldr r7, [r6], #4
    cmp r7, r4
    movhi r4, r7
    subs r5, r5, #1
    bne 1b

    clz r5, r4
    rsb r5, r5, #32
    subs r5, r5, #1
    rsb r5, r5, #15     // shift amount (positive=left, negative=right)

    mov r6, r1          // reset input
    mov r7, r2          // output
    mov r8, r0          // counter
    cmp r5, #0
    bge left
    rsb r5, r5, #0      // r5 = -shift
right_loop:
    ldr r4, [r6], #4
    mov r4, r4, lsr r5
    strh r4, [r7], #2
    subs r8, r8, #1
    bne right_loop
    b done
left:
left_loop:
    ldr r4, [r6], #4
    mov r4, r4, lsl r5
    strh r4, [r7], #2
    subs r8, r8, #1
    bne left_loop

done:
    pop {r4-r8, lr}
    bx lr
