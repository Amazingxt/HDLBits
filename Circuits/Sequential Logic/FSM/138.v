module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    reg [31:0] state;
    always @(posedge clk) begin
        if (reset) 
            state <= 0;
        else begin
            case (state) 
                0: begin
                    if (in==1)
                        state <= 1;
                    else
                        state <= 0;
                end
                1: begin
                    if (in==1)
                        state <= 2;
                    else
                        state <= 0;
                end
                2: begin
                    if (in==1)
                        state <= 3;
                    else
                        state <= 0;
                end
                3: begin
                    if (in==1)
                        state <= 4;
                    else
                        state <= 0;
                end
                4: begin
                    if (in==1)
                        state <= 5;
                    else
                        state <= 0;
                end
                5: begin
                    if (in==1)
                        state <= 6; //6 is the flag state
                    else
                        state <= 7; //7 is the disc state
                end
                6: begin
                    if (in==1)
                        state <= 8; //8 is the err state
                    else
                        state <= 9;
                end
                7: begin
                    if (in==1)
                        state <= 1;
                    else
                    	state <= 0;
                end
                8: begin
                    if (in==1)
                        state <= 8;
                    else
                        state <= 0;
                end
                9: begin
                    if (in==1)
                        state <= 1;
                    else
                    	state <= 0;
                end
            endcase
        end
    end
    
    assign disc = (state==7)?1:0;
    assign flag = (state==9)?1:0;
    assign err = (state==8)?1:0;

endmodule
