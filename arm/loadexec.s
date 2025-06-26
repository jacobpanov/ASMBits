// Jacob Panov

// Copy instructions from Src to Dest and execute them.

// Some testing code
// When debugging in CPUlator, turn off the following debugging checks:
// - Instruction fetch: Modified opcode
// - Instruction fetch: Outside a code section (If Dest is outside the .text section)

Src:
    add r0, r0, r0  // This function returns double its parameter.
    bx lr
Dest:
    .skip 8         // Make space for the code

.global _start
_start:
    ldr r0, =Dest
    ldr r1, =Src
    ldr r2, =8      // There are 2 instructions to copy: 8 bytes
    ldr r3, =4      // Let's call the function with parameter 4
    bl loadexec
    1: b 1b  // done

// Your function starts here:
loadexec:
    push {r4, lr}        // Save callee-saved register and link
    mov r4, r0           // Keep destination address

copy_loop:
    cmp r2, #0           // Any bytes left to copy?
    beq done_copy
    ldrb r12, [r1], #1   // Load byte from source
    strb r12, [r0], #1   // Store byte to destination
    subs r2, r2, #1
    b copy_loop

done_copy:
    mov r0, r3           // Parameter for copied function
    blx r4               // Call copied code
    pop {r4, lr}         // Restore registers
    bx lr                // Return result in r0
