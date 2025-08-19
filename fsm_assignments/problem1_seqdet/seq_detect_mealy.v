module seq_detect_mealy(
    input wire clk,
    input wire rst,  
    input wire din,   
    output reg y      
);

    reg [1:0] state; 
    localparam S0 = 2'b00; 
    localparam S1 = 2'b01; 
    localparam S2 = 2'b10; 
    localparam S3 = 2'b11; 

    always @(posedge clk) begin
        if (rst) begin
            state <= S0;
            y <= 0;
        end else begin
            y <= 0; 

            case (state)
                S0: begin
                    if (din) state <= S1;
                    else state <= S0;
                end
                S1: begin
                    if (din) state <= S2;
                    else state <= S0;
                end
                S2: begin
                    if (din) state <= S2;
                    else state <= S3;     
                end
                S3: begin
                    if (din) begin
                        state <= S1;  
                        y <= 1;       // 1101 detected
                    end else begin
                        state <= S0;
                        y <= 0;
                    end
                end
                default: state <= S0;
            endcase
        end
    end

endmodule
