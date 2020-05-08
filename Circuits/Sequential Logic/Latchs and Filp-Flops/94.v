module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @ (posedge clk) begin
        if (j^k)
        	Q = j & (j^k);
        else
            if (j&k == 1)
            Q = ~Q;
    end

endmodule
