// Jacob Panov

// Returns whether a tree's depth is at most a given bound.
// Prototype: treedepth(root, depth)
// Node layout: [left, right]; null pointer = 0.

.data
node_l: .word 0,0
node_r: .word 0,0
root_n: .word node_l, node_r

.text
.global _start
_start:
    ldr r0, =root_n
    mov r1, #2
    bl treedepth
    1: b 1b

.global treedepth
treedepth:
    push {r4-r7, lr}
    cmp r0, #0
    beq return_true
    cmp r1, #0
    beq return_false
    ldr r4, [r0]
    ldr r5, [r0, #4]
    sub r1, r1, #1
    mov r0, r4
    mov r6, r5
    mov r7, r1
    bl treedepth
    cmp r0, #0
    beq done_false
    mov r0, r6
    mov r1, r7
    bl treedepth
    cmp r0, #0
    beq done_false
    mov r0, #1
    b done
return_true:
    mov r0, #1
    b done
return_false:
    mov r0, #0
    b done
done_false:
    mov r0, #0
done:
    pop {r4-r7, lr}
    bx lr
