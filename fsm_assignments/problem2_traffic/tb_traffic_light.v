module tb_traffic_light;
    reg clk, rst;
    wire [2:0] lights;

    traffic_light dut(clk, rst, lights);

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("wave.vcd");   
        $dumpvars(0, tb_traffic_light); 
        $dumpvars(0, dut);        

        rst = 1;
        #10 rst = 0;
      #200 $finish;             
    end
endmodule
