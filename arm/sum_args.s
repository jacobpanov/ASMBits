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
    push {r4, r5, r6, r7}      // Save callee-saved registers
    mov r4, r0                 // r4 = n (number of arguments to sum)
    mov r5, #0                 // r5 = sum
    mov r6, #0                 // r6 = loop counter
    add r7, sp, #4             // r7 = pointer to first vararg (skip saved lr)

sum_loop:
    cmp r6, r4                 // Have we summed n numbers?
    beq sum_done
    ldr r0, [r7, r6, lsl #2]   // Load next argument
    add r5, r5, r0             // Add to sum
    add r6, r6, #1             // Increment counter
    b sum_loop

sum_done:
    mov r0, r5                 // Return value in r0
    pop {r4, r5, r6, r7}       // Restore callee-saved registers
    bx lr

	
	
