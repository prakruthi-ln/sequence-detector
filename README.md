\# Sequence Detector (1011) – Verilog



\## Overview



Designed a Moore FSM in Verilog to detect the binary sequence 1011 in a serial input stream with \*\*overlapping detection\*\*.



\## Design



\* States represent partial pattern matches (S0 → S4)

\* Output goes HIGH when the sequence is detected (S4)

\* On mismatch, FSM moves to the longest valid partial match instead of resetting



\## Simulation



\* Input: `1001011`

\* Output: `0000001`

\* Correctly detects overlapping occurrences



\## Tools



\* Verilog HDL

\* Xilinx Vivado



\## Key Learning



Implemented FSM design and understood overlapping sequence detection using hardware logic.



