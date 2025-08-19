Input: din (serial data, 1 bit per clock)

Output: y (1-cycle pulse when 1101 is detected)

Reset: Synchronous, active-high (rst)
FSM Type: Mealy


 State Diagram:
State	Meaning	             Next_State_if_din=0	    Next_State_if_din=1	    Output y
S0	     No bits matched	      S0	                    s1                  0
S1	     Matched '1'		      S0	                        s2                  0
S2	     Matched '11'	          S3	                        s2                  0
S3	     Matched '110'	          S0	                        s1                  0(ifdin=1)



Test Streams and Expected Output:
Input Stream ->	Detection Pulse Indices (y=1)
11011011101	 ->    4, 7, 10
11101	     ->    3
101101	     ->    5