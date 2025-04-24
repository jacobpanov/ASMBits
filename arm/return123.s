// Jacob Panov

// This program returns 123 in r0.


.global _start
_start:
    bl func
    1: b 1b  // done

func:
    mov r0, #123  // Set r0 = 123
    bx lr         // Return from the function