module traffic_light (
    input clk, rst,
    output reg [2:0] lights 
);
    typedef enum reg [1:0] {RED=2'b00, GREEN=2'b01, YELLOW=2'b10} state_t;
    state_t ps, ns;
    reg [3:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ps <= RED; cnt <= 0;
        end else if (cnt==4'd9) begin
            ps <= ns; cnt <= 0;
        end else cnt <= cnt+1;
    end

    always @(*) begin
        case(ps)
            RED:    begin lights=3'b100; ns=GREEN; end
            GREEN:  begin lights=3'b001; ns=YELLOW; end
            YELLOW: begin lights=3'b010; ns=RED; end
        endcase
    end
endmodule
