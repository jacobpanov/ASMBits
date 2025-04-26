// Jacob Panov

// This program declares five instances of struct "Node" 
// to represent a 5-node binary tree.

.data
.align 4

// Define the nodes
Root:                   // Node 0 (Root)
    .word Node1         // c1 points to Node 1
    .word Node2         // c2 points to Node 2
    .word 0             // name = 0

Node1:                  // Node 1
    .word 0             // c1 is unused (0)
    .word 0             // c2 is unused (0)
    .word 10             // name = 19

Node2:                  // Node 2
    .word Node3         // c1 points to Node 3
    .word Node4         // c2 points to Node 4
    .word 11             // name = 11

Node3:                  // Node 3
    .word 0             // c1 is unused (0)
    .word 0             // c2 is unused (0)
    .word 20             // name = 20

Node4:                  // Node 4
    .word 0             // c1 is unused (0)
    .word 0             // c2 is unused (0)
    .word 21            // name = 21

