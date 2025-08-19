FSM Design

Type: Moore machine

States:- 4 phases:
NS Green, EW Red (5 ticks)
NS Yellow, EW Red (2 ticks)
NS Red, EW Green (5 ticks)
NS Red, EW Yellow (2 ticks)
Reset: Synchronous, active-high

Outputs:
ns_g, ns_y, ns_r
ew_g, ew_y, ew_r
Exactly one output high per road at any time


Traffic Light FSM States :-
State S0: NS Green, EW Red
Duration: 5 ticks
Next state: S1

State S1: NS Yellow, EW Red
Duration: 2 ticks
Next state: S2

State S2: NS Red, EW Green
Duration: 5 ticks
Next state: S3

State S3: NS Red, EW Yellow
Duration: 2 ticks
Next state: S0