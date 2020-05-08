module top_module( 
    input [2:0] in,
    output [1:0] out );

    integer j, out_temp;
    always @ (*) begin
        out_temp = 0;
        for (j=0;j<3;j=j+1)
            if (in[j]&1'b1)
                out_temp = out_temp + 1;
        out = out_temp;
    end

endmodule
