module top_module (
    input clk,
    input d,
    output q
);

    wire out1, out2;
    always @ (posedge clk)
        out1 <= d;
    always @ (negedge clk)
        out2 <= d;
    
    always @ (*)
        q = clk?out1:out2;
endmodule
