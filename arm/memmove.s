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
    cmp r2, #0
    bxeq lr
    cmp r0, r1
    blo copy_forward
    add r0, r0, r2
    add r1, r1, r2

copy_back:
    ldrb r3, [r1, #-1]!
    strb r3, [r0, #-1]!
    subs r2, r2, #1
    bne copy_back
    bx lr
    
copy_forward:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
    subs r2, r2, #1
    bne copy_forward
    bx lr
