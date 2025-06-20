// Jacob Panov

// This routine copies a block of memory from source to destination.
// The addresses are byte-aligned and may be any length.

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
    bl memcpy
    1: b 1b    // Done

.global memcpy
memcpy:
    // r0 = dest, r1 = src, r2 = length (bytes)
    cmp r2, #0
    beq done
loop:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
    subs r2, r2, #1
    bne loop

done:
    bx lr
