// Jacob Panov

// depth returns 1 if the depth of the tree rooted at `root` is <= d.
// Each node contains two child pointers [a, b].

.data
A: .word B, C
B: .word 0, 0
C: .word 0, 0

.text
.global _start

_start:
    ldr r0, =A
    mov r1, #2
    bl depth
    1: b 1b

.global depth
depth:
    push {r4-r7, lr}
    cmp r0, #0
    beq true_case
    cmp r1, #0
    beq false_case
    ldr r4, [r0]      // left child
    ldr r5, [r0, #4]  // right child
    sub r1, r1, #1
    mov r6, r5        // save right child
    mov r7, r1        // save new depth
    mov r0, r4
    bl depth
    cmp r0, #0
    beq done_false
    mov r0, r6
    mov r1, r7
    bl depth
    cmp r0, #0
    beq done_false
    mov r0, #1
    b done
true_case:
    mov r0, #1
    b done
false_case:
    mov r0, #0
    b done
done_false:
    mov r0, #0
done:
    pop {r4-r7, lr}
    bx lr
