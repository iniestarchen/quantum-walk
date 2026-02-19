# Discrete Quantum Walk on 4-node Cycle

> **Category**: simulation &nbsp;|&nbsp; **Difficulty**: advanced &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 20 &nbsp;|&nbsp; **Depth**: 12

A discrete quantum walk is the quantum analogue of a classical random walk. A 'coin' qubit in superposition drives conditional position shifts: |0⟩ steps left, |1⟩ steps right. Unlike a classical walk, the quantum walker can be in superposition of positions, creating interference patterns. After t steps the probability distribution spreads quadratically faster than classically. This circuit runs 2 steps on a 4-node cycle.

## Expected Output

Non-uniform distribution over 4 positions showing quantum interference

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
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
```

## Tags

`quantum-walk` `search` `random-walk` `speedup` `graph-algorithms`

## References

- [Aharonov, Ambainis, Kempe, Vazirani (2001). Quantum Walks on Graphs. STOC '01](https://doi.org/10.1145/380752.380803)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
