OPENQASM 2.0;
include "qelib1.inc";
// Discrete quantum walk on 4-cycle: 2 steps
// q[0]: Hadamard coin, q[1]: position LSB, q[2]: position MSB
qreg q[3];
creg c[2];
// Initialize: position |00>, coin |+>
h q[0];
// --- Walk step 1 ---
// Coin flip (Hadamard)
h q[0];
// Conditional right shift (coin=|1>): increment position mod 4
ccx q[0],q[1],q[2];
cx q[0],q[1];
// Conditional left shift (coin=|0>): decrement position mod 4
x q[0];
cx q[0],q[1];
ccx q[0],q[1],q[2];
x q[0];
// --- Walk step 2 ---
h q[0];
ccx q[0],q[1],q[2];
cx q[0],q[1];
x q[0];
cx q[0],q[1];
ccx q[0],q[1],q[2];
x q[0];
// Measure position
measure q[1] -> c[0];
measure q[2] -> c[1];
