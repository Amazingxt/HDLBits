module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    always @(*) begin
        integer i;
        out = 8'b00000000;
        for (i=0;i<255;i=i+1)
            if (in[i]==1'b1)
                out = out + 1'b1;
    end

endmodule
