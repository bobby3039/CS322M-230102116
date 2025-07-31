module eq4_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    wire       equal;

    eq4 uut (
        .a(a),
        .b(b),
        .equal(equal)
    );

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, eq4_tb);
    end

    initial begin
        $display("Time | a    b    | equal");
        $display("--------------------------");

        a = 4'b0000; b = 4'b0000; #10 $display("%4t | %b %b |   %b", $time, a, b, equal);
        a = 4'b1100; b = 4'b1100; #10 $display("%4t | %b %b |   %b", $time, a, b, equal);
        a = 4'b1010; b = 4'b0101; #10 $display("%4t | %b %b |   %b", $time, a, b, equal);
        a = 4'b1111; b = 4'b1110; #10 $display("%4t | %b %b |   %b", $time, a, b, equal);
        a = 4'b1111; b = 4'b1111; #10 $display("%4t | %b %b |   %b", $time, a, b, equal);

        $finish;
    end

endmodule
