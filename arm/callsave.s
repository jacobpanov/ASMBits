// Jacob Panov

// Demonstrates preserving callee-saved registers in a function.
// call1234(a, b, c, d) calls the function `secret(1,2,3,4)`
// once and returns how many of the parameters a-d equal that
// return value.

.global _start
	ldr sp, =0x40000000
	mov r0, #10
	mov r1, #10
	mov r2, #20
	mov r3, #30
	bl call1234
	1: b 1b

//secret:  // For debugging, uncomment this label
             // Don't submit with this label though, or you will get a duplicate label error.
	mov r0, #10
	bx lr

.global call1234
call1234:
    push {r4, r5, r6, r7, r8 lr}  // Save callee-saved registers and lr

    mov r4, r0  // a
    mov r5, r1  // b
    mov r6, r2  // c
    mov r7, r3  // d

    // Call the secret function with fixed parameters
    mov r0, #1
    mov r1, #2
    mov r2, #3
    mov r3, #4
    bl secret

    mov r8, #0         // r8 = match counter

    cmp r4, r0
    addeq r8, r8, #1   // Increment if a matches
    cmp r5, r0
    addeq r8, r8, #1   // Increment if b matches
    cmp r6, r0
    addeq r8, r8, #1   // Increment if c matches
    cmp r7, r0
    addeq r8, r8, #1   // Increment if d matches

    mov r0, r8         // Return the match count

    pop {r4, r5, r6, r7, r8, lr}  // Restore callee-saved registers and lr
    bx lr