// Jacob Panov

// size returns the number of nodes in a binary tree.
// Each node contains two child pointers [a, b].

.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    bl size
    1: b 1b

.global size
size:
    push {r4-r6, lr}
    ldr r4, [r0]      // left child
    ldr r5, [r0, #4]  // right child
    mov r6, #1        // count current node
    cmp r4, #0
    beq skip_left
    mov r0, r4
    bl size
    add r6, r6, r0
skip_left:
    cmp r5, #0
    beq skip_right
    mov r0, r5
    bl size
    add r6, r6, r0
skip_right:
    mov r0, r6
    pop {r4-r6, lr}
    bx lr
