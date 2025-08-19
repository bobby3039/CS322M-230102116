module tb_seq_detect_mealy;
    reg clk, rst, din;
    wire y;

    seq_detect_mealy dut(.clk(clk), .rst(rst), .din(din), .y(y));

    
    initial clk = 0;
    always #5 clk = ~clk;

    reg [10:0] stream;
    integer i; 

    initial begin
        rst = 1;
        din = 0;
        #10;
        rst = 0;

        stream = 11'b11011011101;

        for (i = 0; i < 11; i = i + 1) begin
            din = stream[i];
            #10;
        end

        #20;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_seq_detect_mealy);
    end
endmodule
