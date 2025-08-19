Input: din (serial data, 1 bit per clock)

Output: y (1-cycle pulse when 1101 is detected)

Reset: Synchronous, active-high (rst)
FSM Type: Mealy


| State | Meaning         | Next State if din=0 | Next State if din=1 | Output y |
|-------|----------------|------------------|------------------|----------|
| S0    | No bits matched | S0               | S1               | 0        |
| S1    | Matched '1'     | S0               | S2               | 0        |
| S2    | Matched '11'    | S3               | S2               | 0        |
| S3    | Matched '110'   | S0               | S1               | 1 (if din=1) |




Test Streams and Expected Output:
Input Stream ->	Detection Pulse Indices (y=1)
11011011101	 ->    4, 7, 10
11101	     ->    3
101101	     ->    5
