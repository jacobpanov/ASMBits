// Jacob Panov

// Convert a 32-bit number to a hex string without leading zeros.

.data
MyString: .skip 12

.text
.global _start
_start:
    ldr r0, =MyString
    ldr r1, =0x12345678
    bl hexstr
    b _start

// Convert number to string
hexstr:
    push {r4-r7, lr}
    mov r4, r0      // destination pointer
    mov r5, r1      // number
    mov r6, #28     // bit index
    mov r7, #0      // started flag
1:
    mov r2, r5, lsr r6
    and r2, r2, #0xf
    cmp r7, #0
    bne store
    cmp r2, #0
    beq skip
store:
    mov r7, #1
    cmp r2, #9
    addle r2, r2, #'0'
    addgt r2, r2, #'a'-10
    strb r2, [r4], #1
skip:
    subs r6, r6, #4
    bge 1b
    cmp r7, #0
    bne finish
    mov r2, #'0'
    strb r2, [r4], #1
finish:
    mov r2, #0
    strb r2, [r4]
    pop {r4-r7, lr}
    bx lr
