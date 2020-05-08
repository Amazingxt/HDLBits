module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    always @ (posedge clk) begin
        if (reset)
            q = 0;
        else 
            begin
            	q = q+1;
                if (q>9)
                    q = 0;
            end
    end


endmodule
