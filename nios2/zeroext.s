// Jacob Panov
//
// Zero-extend the 8-bit value in r4 and return it.
.global _start
_start:
    movi r4, 0xf0    # First parameter is always in r4
    call zeroext
    br _start        # End of testing code

# A function to zero extend. Only this part will be tested.
zeroext:
    # Implement zero extension here.
