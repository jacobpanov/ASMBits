// Jacob Panov

// This program sorts a ProfitList array by profit descending, then by product ID ascending.

.data
ProdList:
        .word 0x1000, 10
        .word 0x1001, 11
        .word 0x1002, 9

.text
.global _start
_start:
        ldr r0, =ProdList
        ldr r1, =3
        bl sort
        1: b 1b

.global sort
sort:
        // r0 = array pointer, r1 = number of entries
        push {r4-r9, lr}
        cmp r1, #1
        ble done
        mov r4, #0          // i
outer_loop:
        cmp r4, r1
        bge done
        add r5, r4, #1      // j = i+1
inner_loop:
        cmp r5, r1
        bge next_i
        add r6, r0, r4, LSL #3   // addr_i
        add r7, r0, r5, LSL #3   // addr_j
        ldr r8, [r6]
        ldr r9, [r6, #4]
        ldr r2, [r7]
        ldr r3, [r7, #4]
        cmp r3, r9
        bgt swap
        blt no_swap
        cmp r2, r8
        bhs no_swap
swap:
        str r2, [r6]
        str r3, [r6, #4]
        str r8, [r7]
        str r9, [r7, #4]
no_swap:
        add r5, r5, #1
        b inner_loop
next_i:
        add r4, r4, #1
        b outer_loop
done:
        pop {r4-r9, lr}
        bx lr
