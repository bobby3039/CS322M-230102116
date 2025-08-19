module tb_vending_mealy;
  reg  clk, rst;
  reg  [1:0] coin;
  wire dispense, chg5;

  vending_mealy dut(.clk(clk), .rst(rst), .coin(coin),
                    .dispense(dispense), .chg5(chg5));

 
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  task put5;  begin coin=2'b01; @(posedge clk); coin=2'b00; end endtask
  task put10; begin coin=2'b10; @(posedge clk); coin=2'b00; end endtask

  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb_vending_mealy);


    rst=1; coin=0; @(posedge clk);
    rst=0;

 
    put5; put5; put10;  
    #20;
    put10; put10; put5;  
    #50;

    $finish;
  end
endmodule
