module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    genvar j;
    reg [100:0] cout_temp;
    assign cout_temp[0] = cin; 
    generate
        for (j=1;j<101;j=j+1)
            begin: add_loop
                bcd_fadd add (a[4*j-1:4*(j-1)], b[4*j-1:4*(j-1)], cout_temp[j-1], cout_temp[j], sum[4*j-1:4*(j-1)]);
            end
    endgenerate
    assign cout = cout_temp[100];

endmodule
