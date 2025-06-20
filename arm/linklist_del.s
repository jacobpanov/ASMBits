// Jacob Panov

// This program removes the successor node of a linked list node.
// If the node or its successor is null, null is returned.

.data
A: .word B
D: .word 0
C: .word D
B: .word C

.text
.global _start
_start:
    ldr r0, =A
    bl listdel
    1: b 1b   // done

.global listdel
listdel:
    // r0 = pointer to node
    cmp r0, #0
    beq fail
    ldr r1, [r0]       // r1 = node->next
    cmp r1, #0
    beq fail
    ldr r2, [r1]       // r2 = node->next->next
    str r2, [r0]       // node->next = r2
    mov r0, r1         // return removed node
    bx lr
fail:
    mov r0, #0
    bx lr
