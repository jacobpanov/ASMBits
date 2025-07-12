// Jacob Panov
//
// Return the address of the instruction that called `where`.
# Some testing code
.global _start
_start:
    call where
    1: br 1b  # done

# Your function starts here:
where:
    subi r2, r31, 4   # r2 = address of calling instruction
    ret
