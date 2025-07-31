module eq4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire       equal
);

    assign equal = &(~(a ^ b));  

endmodule
