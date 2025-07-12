// Jacob Panov
//
// Set r2 to 123 and return from the function.
.global _start
_start:
    call func
    1: br 1b  # done

func:
    movi r2, 123
    ret
