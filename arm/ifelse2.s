// Jacob Panov

// This program is to simulate an if-then statement.
// The scenario is via a hypothetical machine that serves different
// food to different customers.
// The customers orders are represented by 5 bit numbers, with
// each bit representing a different food.
// The machine will serve the food if the corresponding bit is set.
// However, food is expenseive, so the machine will only serve
// the least expensive food that is ordered.

// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	ands lr, r0, #0x1   // Check if the first bit is set.
  movne r0, #0        // If it is not set, set r0 to 0.
  blne add_a          // Call add_a if the first bit is set.  
    
	ands lr, r0, #0x2   // Check if the second bit is set.
  movne r0, #0        // If it is not set, set r0 to 0.
  blne add_b          // Call add_b if the second bit is set.  
    
	ands lr, r0, #0x4   // Check if the third bit is set.
  movne r0, #0        // If it is not set, set r0 to 0. 
  blne add_c          // Call add_c if the third bit is set.  
    
	ands lr, r0, #0x8   // Check if the fourth bit is set.
  movne r0, #0        // If it is not set, set r0 to 0.
  blne add_d          // Call add_d if the fourth bit is set. 
    
	ands lr, r0, #0x10  // Check if the fifth bit is set.
  movne r0, #0        // If it is not set, set r0 to 0.
  blne add_e          // Call add_e if the fifth bit is set.  
    
  bl done             // Call done if no bits are set. 

	// Restore lr and return.
	pop {pc}