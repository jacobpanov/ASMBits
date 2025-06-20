// Jacob Panov

// This program counts the number of nodes in a singly linked list.
// A null pointer should return 0.

.data
A: .word B
B: .word C
C: .word 0

.text
.global _start
_start:
    ldr r0, =A
    bl listlen
    1: b 1b    // Done

.global listlen
listlen:
    // r0 = pointer to first node
    mov r1, #0          // count
loop:
    cmp r0, #0
    beq done
    ldr r0, [r0]        // move to next node
    add r1, r1, #1
    b   loop

done:
    mov r0, r1
    bx lr
