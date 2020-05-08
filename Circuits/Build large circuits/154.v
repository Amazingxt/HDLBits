module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    reg [3:0] state;
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
                        state <= 1;
                end
                4: state <= 4;
            endcase
        end
    end
     
    assign start_shifting = (state==4);
        
endmodule
