# You can find the machine code for each test in [tests folder](../tests/)
## [ANDN test](../tests/andntest.hex)
```arm
addi x1, x0, 12	x1 = 12 (0b1100)	    00	00C00093
addi x2, x0, 10	x2 = 10 (0b1010)	    04	00A00113
andn x3, x1, x2	x3 = 12 & (~10) = 4	    08	0020818B
sw x3, 105(x3)	mem[4 + 105] = 4	    0C	0631A4A3
done: beq x2, x2, done	Infinite loop	10	00210063
```
in the check result section: do
```verilog
if(DataAdr === 109 & WriteData === 4) begin
    $display("Simulation succeeded");
    $stop;
end else if (DataAdr !== 109) begin
    $display("Simulation failed");
    $stop;
end
```
## [Rotate by 0 Test](../tests/rotate0test.hex)
```arm
addi x1, x0, 123	x1 = 123            00	07B00093
addi x2, x0, 0	x2 = 0 	                04	00000113
rol x3, x1, x2	x3 = rol(123, 0) = 123	08	0420818B
sw x3, 124(x0)	mem[124] = 123	        0C	06302E23 
done: beq x0, x0, done	Infinite loop	10	00000063
```
```verilog
if(DataAdr === 124 & WriteData === 123) begin
    $display("Simulation succeeded: Rotate by 0 test passed.");
    $stop;
end
```

## [ABS(INT_MIN) test](../tests/absintmintest.hex)
```arm
| Instruction       | Machine code | Comment                        |
| ----------------- | ------------ | ------------------------------ |
| addi x1, x0, 1    | 00100093   | x1 = 1                         |
| addi x2, x0, 31   | 01F00113   | x2 = 31                        |
| rol  x1, x1, x2   | 0420808B   | x1 = 0x80000000                |
| abs  x2, x1, x0   | 0600810B   | x2 = abs(INT_MIN) = 0x80000000 |
| sw   x2, 124(x0)  | 06202E23   | store at RAM[124]              |
| beq  x0, x0, done | 00000063   | infinite loop                  |

```
```verilog
if(DataAdr === 124 & WriteData === 32'h80000000) begin
    $display("Simulation succeeded: ABS(INT_MIN) test passed.");
    $stop;
end
```

## [x0 Write Ignored Test](../tests/writex0test.hex)
```arm
addi x1, x0, 12	x1 = 12	                    00	00C00093
addi x2, x0, 10	x2 = 10	                    04	00A00113
andn x0, x1, x2	Attempt to write 4 to x0	08	0020800B
addi x3, x0, 42	x3 = x0 + 42. Should be 42	0C	02A00193
sw x3, 42(x0)	mem[42] = 42	            10	02302523
done: beq x0, x0, done	Infinite loop	    14	00000063
```
```verilog
if(DataAdr === 42 & WriteData === 42) begin
    $display("Simulation succeeded: x0 write ignored test passed.");
    $stop;
end
```

## [final store test](../riscvtest.txt)
already present in riscvtest.txt. just change the file in imem
```verilog
// check results
  always @(negedge clk)
    begin
      if(MemWrite) begin
        if(DataAdr === 100 & WriteData === 25) begin
          $display("Simulation succeeded");
          $stop;
        end else if (DataAdr !== 96) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
```
