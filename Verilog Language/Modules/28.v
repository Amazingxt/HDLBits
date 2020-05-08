module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);
    wire cout1, cout2;
    reg [31:0] b1;
    assign b1 = {32{sub}} ^ b;

    add16 instance1(a[15:0], b1[15:0], sub, result[15:0], cout1);
    add16 instance2(a[31:16], b1[31:16], cout1, result[31:16], cout2);
    
endmodule
