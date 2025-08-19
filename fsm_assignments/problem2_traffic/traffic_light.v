
module traffic_light(
  input  wire clk,
  input  wire rst,   
  input  wire tick,  
  output reg  ns_g, ns_y, ns_r,
  output reg  ew_g, ew_y, ew_r
);

  typedef enum logic [1:0] {S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11} state_t;
  state_t state, next_state;

  reg [2:0] cnt;  

  
  always @(posedge clk) begin
    if (rst) begin
      state <= S0;
      cnt   <= 0;
    end else if (tick) begin
      if ((state==S0 && cnt==4) ||
          (state==S1 && cnt==1) ||
          (state==S2 && cnt==4) ||
          (state==S3 && cnt==1)) begin
        state <= next_state;
        cnt   <= 0;
      end else begin
        cnt <= cnt + 1;
      end
    end
  end

  
  always @(*) begin
    case(state)
      S0: next_state = S1;
      S1: next_state = S2;
      S2: next_state = S3;
      S3: next_state = S0;
      default: next_state = S0;
    endcase
  end

  
  always @(*) begin
    ns_g=0; ns_y=0; ns_r=0;
    ew_g=0; ew_y=0; ew_r=0;
    case(state)
      S0: begin ns_g=1; ew_r=1; end
      S1: begin ns_y=1; ew_r=1; end
      S2: begin ns_r=1; ew_g=1; end
      S3: begin ns_r=1; ew_y=1; end
    endcase
  end

endmodule
