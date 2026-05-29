## SEQUENCE DETECTOR USING VERILOG FSM

  A Verilog HDL implementation of a binary sequence detector using a Finite State Machine (FSM) with simulation testbench verification.

## Overview

This project implements a sequence detector in Verilog HDL that detects a predefined binary sequence from a serial input stream. The design is verified using a dedicated testbench that checks multiple cases including normal detection, overlapping sequences, reset behavior, and invalid inputs.

## Features
-Binary sequence detection using FSM
-Supports overlapping sequence detection
-Reset functionality included
-Fully verified with a Verilog testbench
-Behavioral simulation compatible with Vivado 

## How It Works

The sequence detector continuously monitors the input bit stream and changes states according to the received input.

When the target sequence is detected:

-The output signal (out) becomes HIGH (1)
-The FSM transitions appropriately for overlapping detection

## Testbench Verification

The testbench validates the following scenarios:

1.**Normal Sequence Detection**

  Checks whether the target sequence is correctly detected.

2. **Overlapping Sequence Detection**

  Verifies detection when patterns overlap.

3.**All Zeroes Input**

  Ensures false detection does not occur.

4.**All Ones Input**

  Tests robustness against invalid patterns.

5.**Reset During Operation**

  Confirms FSM state resets correctly when reset is asserted mid-sequence.

### KEY TAKEAWAYS
1.**Overlapping Detection Requires Careful State Design**
   - After detecting 1011, the next state must consider that the last `1` could start a new sequence
   - From S4, if input is 1 → go to S1 (not S0)
   - This enables detecting 1011011 twice

2.**Edge Cases Are Critical**
   - Testing only the "happy path" (1011) misses real bugs
   - All-zeros stream revealed my FSM stays in S0 correctly
   - All-ones stream showed FSM cycles in S1 (never sees 0)
   - Reset mid-sequence verified asynchronous reset works properly

3. **Asynchronous Reset Is Important**
   - always @(posedge clk or posedge rst) gives reset priority
   - FSM returns to S0 immediately when reset is asserted
   - No need to wait for clock edge
  
## OUTPUT WAVEFORM

<img width="1451" height="573" alt="Screenshot 2026-05-29 182416" src="https://github.com/user-attachments/assets/97487d31-26e5-42a4-83d8-f34e7702a207" />

## Simulation Result

The waveform shows the sequence detector being tested under different input conditions to verify that the FSM behaves correctly in all cases. The simulation includes **normal sequence detection, overlapping patterns, all-zero inputs, all-one inputs, and reset behavior during operation**. Most of the time, the output (`out`) remains LOW (`0`), which confirms that the detector does not falsely recognize incorrect patterns. Whenever the expected sequence appears in the input stream, the output briefly goes HIGH (`1`), showing successful detection. The waveform also confirms that the reset signal correctly clears the FSM state and restarts the detection process. Overall, the simulation verifies that the sequence detector works reliably across both normal and edge-case scenarios.
