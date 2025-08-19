module tb_traffic_light;
  reg clk, rst, tick;
  wire ns_g, ns_y, ns_r, ew_g, ew_y, ew_r;

  traffic_light dut(
    .clk(clk), .rst(rst), .tick(tick),
    .ns_g(ns_g), .ns_y(ns_y), .ns_r(ns_r),
    .ew_g(ew_g), .ew_y(ew_y), .ew_r(ew_r)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_traffic_light);
    clk = 0; rst = 1; tick = 0;
    #10 rst = 0;
    #2000 $finish;
  end

  always #5 clk = ~clk;       
  always #100 tick = ~tick;   
endmodule
