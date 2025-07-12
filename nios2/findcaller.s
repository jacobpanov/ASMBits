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
    # Implement caller finding here.
