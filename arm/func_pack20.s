// Jacob Panov

// pack20 stores 20 bytes to memory starting at `array`.
// The parameters are: pointer `array` in r0, bytes b1..b3 in
// r1-r3, and bytes b4..b20 on the stack.

.global _start
_start:
    ldr sp, =0x40000000 // Initial SP
    ldr r0, =0x20000
    mov r1, #22
    mov r2, #17
1:
    push {r1}
    sub r1, #1
    subs r2, #1
    bne 1b
        
    mov r1, #3
    mov r2, #4
    mov r3, #5
    
    bl pack20
    add sp, #68   // Caller cleans up the stack: Remove 17 parameters.
    1: b 1b  // done

.data
Buffer: .space 20

.text
.global pack20
pack20:
    // r0 -> array, r1-r3 contain the first three bytes
    strb r1, [r0], #1
    strb r2, [r0], #1
    strb r3, [r0], #1

    mov r1, sp        // r1 -> b4 on the stack
    mov r2, #17       // Remaining bytes to store
1:
    ldrb r3, [r1], #4
    strb r3, [r0], #1
    subs r2, r2, #1
    bne 1b
    bx lr
