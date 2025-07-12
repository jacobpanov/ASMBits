// Jacob Panov
//
// Load the value stored at Data and return it.
#Data: .word 0x123        # Uncomment for debugging
.global _start
_start:
    call load
    1: br 1b    # Done

load:
    ldw r2, Data(r0)   # Load word at Data into r2 (return register)
    ret                # Return to caller
