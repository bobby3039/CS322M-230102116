addi x1, x0, 12	x1 = 12 (0b1100)	    0x00	0x00C00093
addi x2, x0, 10	x2 = 10 (0b1010)	    0x04	0x00A00113
andn x3, x1, x2	x3 = 12 & (~10) = 4	    0x08	0x0020818B
sw x3, 105(x3)	mem[4 + 105] = 4	    0x0C	0x0631A4A3
done: beq x2, x2, done	Infinite loop	0x10	0x00210063