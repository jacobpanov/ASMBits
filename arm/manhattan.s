// Jacob Panov

// Manhattan distance to nearest subway station.

.data
Map: .byte 1, 0, 0, 1, 0

.text
.global _start
_start:
    ldr r0, =5
    ldr r1, =1
    ldr r2, =Map
    bl manhattan
    1: b 1b

.global manhattan
manhattan:
    push {r4-r11, lr}
    mov r4, r0      // width
    mov r5, r1      // height
    mov r6, r2      // map pointer
    mov r7, r4, asr #1  // center x
    mov r8, r5, asr #1  // center y
    mov r0, #-1     // result
    mov r9, #0      // found flag
    mov r10, #0     // y index
    mov r11, r6     // pointer
outer_y:
    cmp r10, r5
    bge finish
    mov r1, #0      // x index
inner_x:
    cmp r1, r4
    bge next_row
    ldrb r2, [r11], #1
    cmp r2, #0
    beq skip
    subs r2, r1, r7
    rsbmi r2, r2, #0
    subs r3, r10, r8
    rsbmi r3, r3, #0
    add r2, r2, r3
    cmp r9, #0
    bne compare
    mov r0, r2
    mov r9, #1
    b skip
compare:
    cmp r2, r0
    movlt r0, r2
skip:
    add r1, r1, #1
    b inner_x
next_row:
    add r10, r10, #1
    b outer_y
finish:
    cmp r9, #0
    bne done
    mov r0, #-1
done:
    pop {r4-r11, lr}
    bx lr
