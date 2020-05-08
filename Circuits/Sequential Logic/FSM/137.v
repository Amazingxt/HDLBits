module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    
    reg [31:0] state;
    reg odd;
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state) 
                0: begin
                    odd <= 0;
                    if (in==0)
                        state <= 1;
                    else 
                        state <= 0;
                end
                1: begin
                    state <= 2;
                    out_byte[0] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                2: begin
                    state <= 3;
                    out_byte[1] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                3: begin
                    state <= 4;
                    out_byte[2] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                4: begin
                    state <= 5;
                    out_byte[3] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                5: begin
                    state <= 6;
                    out_byte[4] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                6: begin
                    state <= 7;
                    out_byte[5] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                7: begin
                    state <= 8;
                    out_byte[6] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                8: begin
                    state <= 9;
                    out_byte[7] <= in;
                    if (in==1)
                        odd <= ~ odd;
                end
                9: begin
                    if (in==1)
                        odd <= ~ odd;
                    state <= 10;
                end
                10: begin
                    if (in==1)
                        state <= 11;
                    else
                        state <= 12;
                end
                11: begin
                    if (in==0) begin
                        state <= 1;
                    	odd <= 0; //这个地方odd置0很容易忘记
                    end
                    else
                        state <= 0;
                end
                12: begin
                    if (in==1)
                        state <= 0;
                    else
                        state <= 12;
                end
            endcase
        end
    end
	
    assign done = ((state==11) & (odd==1))?1:0;

endmodule
