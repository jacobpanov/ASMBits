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
    push {r4, r5, r6, r7}      // Save callee-saved registers
    sub sp, sp, #16            // Make space for 4 words
    str r0, [sp, #0]           // Store r0 at lowest address
    str r1, [sp, #4]           // Store r1
    str r2, [sp, #8]           // Store r2
    str r3, [sp, #12]          // Store r3

    mov r4, sp                 // r4 = pointer to n1 (lowest address)
    mov r5, #0                 // r5 = sum
    mov r6, #0                 // r6 = loop counter

sum_loop:
    ldr r7, [r4, r6, lsl #2]   // Load argument (each is 4 bytes)
    add r5, r5, r7             // Add to sum
    add r6, r6, #1             // Increment counter
    cmp r6, #20                // 20 arguments total
    blt sum_loop

    mov r0, r5                 // Return value in r0
    add sp, sp, #16            // Remove the 4 pushed arguments
    pop {r4, r5, r6, r7}       // Restore callee-saved registers
    bx lr

