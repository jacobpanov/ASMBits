// Jacob Panov

// Demonstrates calling another function multiple times.
// pack20 reads 20 groups of three bytes from Src and stores packed
// words to Dst using pack3.

.data
Src:
    .byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60
Dst:
    .space 20*4

.text
.global _start
_start:
    ldr r0, =Src
    ldr r1, =Dst
    bl pack20
    1: b 1b

.global pack20
pack20:
    push {r4-r6, lr}
    mov r4, r0        // src
    mov r5, r1        // dst
    mov r6, #20
loop:
    ldrb r0, [r4], #1
    ldrb r1, [r4], #1
    ldrb r2, [r4], #1
    bl pack3
    str r0, [r5], #4
    subs r6, r6, #1
    bne loop
    pop {r4-r6, lr}
    bx lr

// pack3 as defined earlier
.global pack3
pack3:
    lsl r0, r0, #16
    orr r0, r0, r1, lsl #8
    orr r0, r0, r2
    bx lr
