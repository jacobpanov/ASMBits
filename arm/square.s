// Jacob Panov

// This routine draws a white square onto a 640x480 16-bit image.
// The image has 640 pixels per row and 480 rows, 2 bytes per pixel.

.data
Img: .skip 640*480*2

.text
.global _start
_start:
    ldr r0, =Img    // Image
    ldr r1, =1      // left
    ldr r2, =0      // top
    ldr r3, =3      // size
    bl square
    1: b 1b    // Done

.global square
square:
    // r0 = image pointer, r1 = left, r2 = top, r3 = size
    push {r4, r5, r6, r7, lr}
    ldr r4, =1280          // bytes per row (640*2)
    mul r5, r2, r4         // offset for top rows
    add r5, r5, r1, LSL #1 // add left offset (2 bytes per pixel)
    add r0, r0, r5         // starting pixel address
    ldr r2, =0xffff        // white pixel value
    mov r6, r3             // number of rows remaining
row_loop:
    cmp r6, #0
    beq end
    mov r5, r3             // column counter
    mov r7, r0             // pointer to start of row
col_loop:
    cmp r5, #0
    beq next_row
    strh r2, [r7], #2
    subs r5, r5, #1
    b   col_loop
next_row:
    add r0, r0, r4         // move to next row
    subs r6, r6, #1
    b   row_loop
end:
    pop {r4, r5, r6, r7, lr}
    bx lr
