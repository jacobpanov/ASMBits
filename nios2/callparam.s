// Jacob Panov
//
// Demonstrates passing parameters to a function.
// call1234 tail-calls `secret` with the arguments 1, 2, 3 and 4.
.global _start
_start:
    movia sp, 0x04000000
    call call1234
    1: br 1b

not_secret:  # For debugging, call this instead of secret.
             # Call "secret" when submitting or you'll get wrong answer!
    movi r2, 1
    ret

.global call1234
call1234:
    # Implement tail call here.
