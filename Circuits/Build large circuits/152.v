module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    reg [9:0] state;
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            if (state<999)
                state <= state + 1;
            else
                state <= 0;
        end
    end
    
    assign q = state;
                
endmodule
