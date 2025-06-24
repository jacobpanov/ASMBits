// Jacob Panov

// pack20 stores 20 bytes to memory starting at `array`.
// The parameters are: pointer `array` in r0, bytes b1..b3 in
// r1-r3, and bytes b4..b20 on the stack.

.global _start
_start:
    // Example call
    ldr r0, =Buffer
    mov r1, #3
    mov r2, #4
    mov r3, #5
    // Push remaining bytes 6..22 (example values)
    mov r4, #22
    mov r5, #17
1:
    push {r4}
    sub r4, r4, #1
    subs r5, r5, #1
    bne 1b
    bl pack20
    add sp, sp, #68      // clean 17 words
    1: b 1b

.data
Buffer: .space 20

.text
.global pack20
pack20:
    push {lr}
    mov r4, r0       // pointer to array
    // store first three bytes
    strb r1, [r4], #1
    strb r2, [r4], #1
    strb r3, [r4], #1
    // pointer to remaining stack parameters
    add r1, sp, #4
    mov r2, #17
2:
    ldrb r3, [r1], #4
    strb r3, [r4], #1
    subs r2, r2, #1
    bne 2b
    pop {lr}
    bx lr
