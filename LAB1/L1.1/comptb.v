`timescale 1ns / 1ps

module comp_tb;

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, comp_tb);
    end

    reg a;
    reg b;
    wire o1;
    wire o2;
    wire o3;

    comp uut (
        .a(a),
        .b(b),
        .o1(o1),
        .o2(o2),
        .o3(o3)
    );

    initial begin
        $display("Time | a b | o1 (a>b) o2 (a<b) o3 (a==b)");
        $display("-----|-----|-----------------------------");

        a = 0; b = 0;
        #10 $display("%4t | %b %b |     %b       %b       %b", $time, a, b, o1, o2, o3);

        a = 0; b = 1;
        #10 $display("%4t | %b %b |     %b       %b       %b", $time, a, b, o1, o2, o3);

        a = 1; b = 0;
        #10 $display("%4t | %b %b |     %b       %b       %b", $time, a, b, o1, o2, o3);

        a = 1; b = 1;
        #10 $display("%4t | %b %b |     %b       %b       %b", $time, a, b, o1, o2, o3);

        $finish;
    end

endmodule
