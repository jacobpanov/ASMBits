// Jacob Panov

// This program is to simulate an if-then statement.
// The scenario is via a hypothetical machine that serves different
// food to different customers.
// The customers orders are represented by 5 bit numbers, with
// each bit representing a different food.
// The machine will serve the food if the corresponding bit is set.

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	ands lr, r0, #0x1
  blne add_a
  ands lr, r0, #0x2
  blne add_b
  ands lr, r0, #0x4
  blne add_c
  ands lr, r0, #0x8
  blne add_d
  ands lr, r0, #0x10
  blne add_e
  bl done

	// ARM: Return by popping lr directly into pc
	pop {pc}