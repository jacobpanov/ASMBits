// Jacob Panov

// Memory copy that handles overlapping regions.

.data
.word 0x9999
Dest: .word 0, 0, 0, 0, 0xaaaa
Src:  .word 1, 2, 3, 4, 0xbbbb

.text
.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =16
    bl memmove
    1: b 1b

.global memmove
memmove:
    push {r4-r5, lr}
    cmp r2, #0
    beq finish
    cmp r0, r1
    beq finish
    mov r3, r0          // save dest pointer
    add r4, r1, r2      // end of source
    cmp r0, r1
    blt forward_copy
    cmp r0, r4
    bge forward_copy
    // overlapping copy backward
    add r1, r1, r2
    add r0, r0, r2
1:
    subs r2, r2, #1
    ldrb r5, [r1, #-1]!
    strb r5, [r0, #-1]!
    bne 1b
    mov r0, r3
    b finish
forward_copy:
1:
    ldrb r5, [r1], #1
    strb r5, [r0], #1
    subs r2, r2, #1
    bne 1b
    mov r0, r3
finish:
    pop {r4-r5, lr}
    bx lr
