module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    reg [3:0] state;
    always @(posedge clk) begin
        if (~resetn)
            state <= 0;
        else begin
            case (state)
                0: begin
                    if (r[1]==1)
                        state <= 1;
                    else begin
                        if (r[2]==1)
                            state <= 2;
                        else begin
                            if (r[3]==1)
                                state <= 3;
                            else
                                state <= 0;
                        end
                    end
                end
                1: begin
                    if (r[1]==1)
                        state <= 1;
                    else 
                        state <= 0;
                end
                2: begin
                    if (r[2]==1)
                        state <= 2;
                    else
                        state <= 0;
                end
                3: begin
                    if (r[3]==1)
                        state <= 3;
                    else
                        state <= 0;
                end
            endcase
        end
    end
    
    assign g[1] = (state==1)?1:0;
    assign g[2] = (state==2)?1:0;
    assign g[3] = (state==3)?1:0;

endmodule
