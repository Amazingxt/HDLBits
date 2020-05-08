module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    genvar j;
    reg [100:0] cout_temp;
    assign cout_temp[0] = cin;
    generate 
        for (j=0;j<100;j=j+1)
            begin: add_loop
                add add1 (a[j], b[j], cout_temp[j], sum[j], cout_temp[j+1]);
            end
    endgenerate
            
    assign cout = cout_temp[100:1];

endmodule

module add (
    input a,b, cin,
    output sum, cout);
    
    assign {cout, sum} = a + b + cin;
endmodule
