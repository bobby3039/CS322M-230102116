 Designed the vending machine using a Mealy FSM with four states corresponding to the accumulated amount: S0 (0), S5 (5), S10 (10), S15 (15).

Inputs:
coin[1:0] (01=5, 10=10, 00=idle, 11=ignore)

Outputs:
dispense : one-cycle pulse when total ≥ 20
chg5 : one-cycle pulse if total = 25

| Current State | Input Coin | Next State | Outputs           | Description                                      |
|---------------|-----------|------------|-----------------|--------------------------------------------------|
| S0            | 5         | S5         | dispense=0       | Accumulate 5                                     |
| S0            | 10        | S10        | dispense=0       | Accumulate 10                                    |
| S5            | 5         | S10        | dispense=0       | Accumulate 5                                     |
| S5            | 10        | S15        | dispense=0       | Accumulate 10                                    |
| S10           | 5         | S15        | dispense=0       | Accumulate 5                                     |
| S10           | 10        | S0         | dispense=1       | Total ≥15, dispense, reset to S0                |
| S15           | 5         | S0         | dispense=1       | Total=15, dispense, reset to S0                 |
| S15           | 10        | S0         | dispense=1, chg5=1 | Total>15, dispense + return 5 as change, reset |



Waveform Behavior:
Sequence 5 → 5 → 10 → At the last coin, dispense=1 for one cycle.
Sequence 10 → 10 → 5 → At the last coin, dispense=1 and chg5=1 for one cycle.
After vending, the FSM always resets to S0.
