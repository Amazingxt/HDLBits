module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire cout1, cout2, cout3;
    add add1 (x[0], y[0], 1'b0, cout1, sum[0]);
    add add2 (x[1], y[1], cout1, cout2, sum[1]);
    add add3 (x[2], y[2], cout2, cout3, sum[2]);
    add add4 (x[3], y[3], cout3, sum[4], sum[3]);
endmodule

module add (
    input a, b, cin,
    output cout, sum);
	assign {cout, sum} = a + b + cin;
endmodule