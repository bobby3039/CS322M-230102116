module vending_mealy (
    input clk, rst,
    input [1:0] coin, 
    output reg dispense
);
    typedef enum reg [1:0] {S0=2'b00,S5=2'b01,S10=2'b10} state_t;
    state_t ps,ns;

    always @(posedge clk or posedge rst) begin
        if(rst) ps<=S0;
        else ps<=ns;
    end

    always @(*) begin
        ns=ps; dispense=0;
        case(ps)
            S0: case(coin)
                2'b01: ns=S5;
                2'b10: ns=S10;
            endcase
            S5: case(coin)
                2'b01: begin ns=S10; end
                2'b10: begin dispense=1; ns=S0; end
            endcase
            S10: case(coin)
                2'b01: begin dispense=1; ns=S0; end
                2'b10: begin dispense=1; ns=S5; end
            endcase
        endcase
    end
endmodule
