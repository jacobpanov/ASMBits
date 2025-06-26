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

