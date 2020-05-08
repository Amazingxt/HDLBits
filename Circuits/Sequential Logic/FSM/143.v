module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    reg [3:0] state;
    always @(posedge clk) begin
        if (reset) 
            state <= 0;
        else begin
            case (state)
                0: begin
                    if (x==0)
                        state <= 0;
                    else
                        state <= 1;
                end
                1: begin
                    if (x==0)
                        state <= 1;
                    else
                        state <= 4;
                end
                2: begin
                    if (x==0)
                        state <= 2;
                    else
                        state <= 1;
                end
                3: begin
                    if (x==0)
                        state <= 1;
                    else
                        state <= 2;
                end
                4: begin
                    if (x==0)
                        state <= 3;
                    else
                        state <= 4;
                end
            endcase
        end
    end
    
    assign z = ((state==3) | (state==4))?1:0;
                    

endmodule
