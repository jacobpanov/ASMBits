// Jacob Panov

// Recursively computes the number of nodes in a binary tree.
// Node layout: [left, right]; null pointer = 0.

.data
node_left:  .word 0, 0
node_right: .word 0, 0
root_node:  .word node_left, node_right

.text
.global _start
_start:
    ldr r0, =root_node
    bl treesize
    1: b 1b

.global treesize
treesize:
    push {r4-r6, lr}
    cmp r0, #0
    beq zero
    ldr r4, [r0]
    ldr r5, [r0, #4]
    mov r0, r4
    bl treesize
    mov r6, r0
    mov r0, r5
    bl treesize
    add r0, r0, r6
    add r0, r0, #1
    pop {r4-r6, lr}
    bx lr
zero:
    mov r0, #0
    pop {r4-r6, lr}
    bx lr
