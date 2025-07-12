// Jacob Panov
//
// Count the number of set bits in the input value.
.global _start
_start:
    movia r4, 5
    call popcount
    1: br 1b    # Done

# Only your function (starting at popcount) is judged.
popcount:
    # Implement popcount here.
