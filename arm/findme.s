// Jacob Panov

// Return the address of this function.

// Some testing code
.global _start
_start:
    bl where
    1: b 1b  // done

// Your function starts here:
where:
    adr r0, where  // Address of this function
    bx lr          // Return to caller

