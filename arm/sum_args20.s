// Jacob Panov

// sum computes the sum of exactly 20 integer arguments.
// Prototype: int sum(int n1, int n2, ..., int n20);

.global _start
_start:
	ldr sp, =0x04000000	// Initial sp
	sub sp, sp, #64	// 16 stack parameters
	mov r0, #5
	mov r1, #20
	mov r2, sp
initloop:
	str r0, [r2], #4       // Post-indexed addressing: Add 4 to r2 after
	add r0, r0, #1
	cmp r0, r1
	ble initloop

	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	
	bl sum
	add sp, sp, #64	// Clean up stack
	1: b 1b  // done

sum:
    // Save callee-saved registers and push the four arguments so all
    // 20 parameters are consecutive on the stack.
    push {r0, r1, r2, r3}
    push {r4, r5, r6, r7}

    add r4, sp, #16            // r4 -> first argument (saved r0)
    mov r5, #20                // Number of parameters
    mov r6, #0                 // Accumulated sum

sum_loop:
    ldr r7, [r4], #4           // Load next argument and advance pointer
    add r6, r6, r7
    subs r5, r5, #1
    bne sum_loop

    mov r0, r6                 // Return value
    pop {r4, r5, r6, r7}       // Restore saved registers
    add sp, sp, #16            // Drop saved arguments
    bx lr

