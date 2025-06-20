// Jacob Panov

// This program finds the product name for the product with maximum profit.
// If the product_id cannot be found in the info list, return 0.

.data
ProdList:
        .word 0x1000, 10
        .word 0x1001, 11
        .word 0x1002, 9

ProdInfo:
        .word 0x1000, 0x200
        .word 0x1001, 0x210
        .word 0x1002, 0x220

.text
.global _start
_start:
        ldr r0, =ProdList
        ldr r1, =3
        ldr r2, =ProdInfo
        ldr r3, =3
        bl find
        1: b 1b

.global find
find:
        // r0 = ProfitList*, r1 = entries, r2 = ProductInfo*, r3 = info entries
        push {r4-r7, lr}
        ldr r4, [r0], #4    // first product_id
        ldr r5, [r0], #4    // first profit
        mov r6, r4          // best id
        mov r7, r5          // best profit
        subs r1, r1, #1
find_loop:
        cmp r1, #0
        beq search_info
        ldr r4, [r0], #4
        ldr r5, [r0], #4
        cmp r5, r7
        ble next
        mov r7, r5
        mov r6, r4
next:
        subs r1, r1, #1
        b find_loop

search_info:
        mov r0, r2          // pointer to ProductInfo
        mov r1, r3          // number of entries
info_loop:
        cmp r1, #0
        beq not_found
        ldr r4, [r0], #4
        ldr r5, [r0], #4
        cmp r4, r6
        beq found
        subs r1, r1, #1
        b info_loop
found:
        mov r0, r5
        pop {r4-r7, lr}
        bx lr
not_found:
        mov r0, #0
        pop {r4-r7, lr}
        bx lr
