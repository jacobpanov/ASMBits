// Jacob Panov

// pack3 stores three integers into consecutive words in memory.
// Parameters: r0=array pointer, r1=n1, r2=n2, r3=n3.

.global _start
_start:
    ldr r0, =0x20000
    mov r1, #3
    mov r2, #4
    mov r3, #5
    bl pack3
    1: b 1b

.global pack3
pack3:
    stm r0, {r1, r2, r3}
    bx lr
