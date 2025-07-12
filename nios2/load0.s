// Jacob Panov
//
// Load the value stored at Data and return it.
#Data: .word 0x123        # Uncomment for debugging
.global _start
_start:
    call load
    1: br 1b    # Done

load:
    # Implement load from label here.
