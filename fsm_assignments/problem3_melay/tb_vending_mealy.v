module tb_vending_mealy;
    reg clk,rst;
    reg [1:0] coin;
    wire dispense;

    vending_mealy dut(clk,rst,coin,dispense);

    
    initial begin clk=0; forever #5 clk=~clk; end

    
    initial begin
        $dumpfile("waves.vcd");   
        $dumpvars(0, tb_vending_mealy); 
    end

    initial begin
        rst=1; coin=0; #12 rst=0;

        #10 coin=2'b01; 
        #10 coin=2'b10; 
        #10 coin=0;

        #10 coin=2'b10; 
        #10 coin=2'b10; 
        #10 coin=0;

        #10 coin=2'b10; 
        #10 coin=2'b01; 
        #10 coin=0;

        #30 $finish; 
    end
endmodule
