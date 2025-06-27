// Jacob Panov

// Maximum subarray sum (O(n^2) solution).

.data
Array: .word -1, -1, 3, -1, 3, -2

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =6
    bl subarraysum
    b _start

// Sum elements of array
subarraysum:
    push {r4-r8, lr}
    mov r4, r0      // base pointer
    mov r5, r1      // length
    ldr r0, [r4]    // max_sum
    mov r6, #0      // outer index
outer_loop:
    mov r7, #0      // current sum
    mov r8, r4
    add r8, r8, r6, lsl #2
    mov r3, r5
    sub r3, r3, r6
inner_loop:
    ldr r2, [r8], #4
    add r7, r7, r2
    cmp r7, r0
    movgt r0, r7
    subs r3, r3, #1
    bne inner_loop
    add r6, r6, #1
    cmp r6, r5
    blt outer_loop
    pop {r4-r8, lr}
    bx lr
