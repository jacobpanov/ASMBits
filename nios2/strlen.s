// Jacob Panov
//
// Determine the length of a null-terminated string.
.data
MyString: .string "Hello World"

.text
.global _start
_start:
    movia r4, MyString
    call strlen
    1: br 1b

.global strlen
strlen:
    mov     r2, r0           # r2 = 0 (initialize length)
strlen_loop:
    ldbu    r3, 0(r4)        # load byte from [r4] into r3
    beq     r3, r0, strlen_done  # if byte == 0, end of string
    addi    r2, r2, 1        # increment length
    addi    r4, r4, 1        # move to next byte
    br      strlen_loop      # repeat
strlen_done:
    ret                      # length in r2
