module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    reg [31:0] state;
    reg [1:0] catch;
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state)
                0: begin
                    if (s==0)
                        state <= 0;
                    else begin
                        catch <= 0;
                        state <= 1;
                    end
                end
                1: begin
                    if (w==1)
                        catch <= 1;
                    else
                        catch <= 0;
                    state <= 2;
                end
                2: begin
                    if (w==1)
                        catch <= catch + 1;
                    state <= 3;
                end
                3: begin
                    if (w==1)
                        catch <= catch + 1;
                    state <= 1;
                end
                        
            endcase
        end
    end
    
    assign z = ((state==1) & (catch==2))?1:0;

endmodule
