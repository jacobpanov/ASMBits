// Jacob Panov

// Demonstrates preserving callee-saved registers in a function.
// call1234(a, b, c, d) calls the function `secret(1,2,3,4)`
// once and returns how many of the parameters a-d equal that
// return value.

.global _start
_start:
    mov r0, #10
    mov r1, #10
    mov r2, #20
    mov r3, #30
    bl call1234
    1: b 1b

.global call1234
call1234:
    push {r4-r8, lr}
    mov r4, r0
    mov r5, r1
    mov r6, r2
    mov r7, r3

    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl secret
    mov r8, r0       // secret result

    mov r0, #0       // count
    cmp r4, r8
    addeq r0, r0, #1
    cmp r5, r8
    addeq r0, r0, #1
    cmp r6, r8
    addeq r0, r0, #1
    cmp r7, r8
    addeq r0, r0, #1

    pop {r4-r8, lr}
    bx lr
