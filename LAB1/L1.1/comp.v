module comp (
    input wire a,
    input wire b,
    output wire o1,
    output wire o2,
    output wire o3
);
    assign o1 = a > b;  
    assign o2 = a < b;  
    assign o3 = a == b; 

endmodule