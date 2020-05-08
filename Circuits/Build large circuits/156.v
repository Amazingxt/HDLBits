module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    reg [5:0] state;
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state)
                0: begin
                    if (data==1)
                        state <= 1;
                    else
                        state <= 0;
                end
                1: begin
                    if (data==1)
                        state <= 2;
                    else
                        state <= 0;
                end
                2: begin
                    if (data==0)
                        state <= 3;
                    else 
                        state <= 2;
                end
                3: begin
                    if (data==1)
                        state <= 4;
                    else
                        state <= 0;
                end
                4,5,6,7: state <= state + 1;
                8: begin
                    if (done_counting==1)
                        state <= 9;
                    else
                        state <= 8;
                end
                9: begin
                    if (ack==1)
                        state <= 0;
                    else 
                        state <= 9;
                end
            endcase
        end
    end
    
    assign shift_ena = (state==4) | (state==5) | (state==6) | (state==7);
    assign counting = (state==8);
    assign done = (state==9);
           
endmodule
