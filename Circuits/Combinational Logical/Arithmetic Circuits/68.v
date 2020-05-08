module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    add add1 (a[0], b[0], cin, cout[0], sum[0]);
    add add2 (a[1], b[1], cout[0], cout[1], sum[1]);
    add add3 (a[2], b[2], cout[1], cout[2], sum[2]);
endmodule

module add(
    input a, b, cin,
    output cout, sum);
    assign {cout, sum} = a + b + cin;
endmodule