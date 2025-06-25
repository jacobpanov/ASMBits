// Jacob Panov

// sum computes the sum of a variable number of integer arguments.
// Prototype: int sum(int n, ...);

.global _start
_start:
	ldr sp, =0x40000000	// Initial sp
	mov r0, #2
	mov r1, #1
	mov r2, #2
	
	bl sum
	1: b 1b  // done

.global sum
sum:
    // Push the four register arguments so that all parameters are on the stack
    push {r0, r1, r2, r3}
    // Save callee-saved registers used by the routine
    push {r4, r5, r6, r7}

    mov r4, r0                 // r4 = n (number of integers)
    add r5, sp, #20            // r5 -> first integer argument (saved r1)
    mov r6, #0                 // r6 = accumulated sum

sum_loop:
    cmp r4, #0                 // Have we processed all n numbers?
    beq sum_done
    ldr r7, [r5], #4           // Load next argument and advance pointer
    add r6, r6, r7
    subs r4, r4, #1
    bne sum_loop

sum_done:
    mov r0, r6                 // Return value
    pop {r4, r5, r6, r7}       // Restore registers
    add sp, sp, #16            // Remove saved arguments
    bx lr

	
	
