 Designed the vending machine using a Mealy FSM with four states corresponding to the accumulated amount: S0 (0), S5 (5), S10 (10), S15 (15).

Inputs:
coin[1:0] (01=5, 10=10, 00=idle, 11=ignore)

Outputs:
dispense : one-cycle pulse when total ≥ 20
chg5 : one-cycle pulse if total = 25

State Diagram:
From S10 + coin=10 → dispense=1, reset to S0.
From S15 + coin=5 → dispense=1, reset to S0.
From S15 + coin=10 → dispense=1 and chg5=1, reset to S0.
All other transitions accumulate coins without outputs.


Waveform Behavior:
Sequence 5 → 5 → 10 → At the last coin, dispense=1 for one cycle.
Sequence 10 → 10 → 5 → At the last coin, dispense=1 and chg5=1 for one cycle.
After vending, the FSM always resets to S0.