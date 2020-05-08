module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [3:0] state;
    
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state)
                0: state <= 1;
                1: state <= 2;
                2: state <= 3;
                3: state <= 4;
                4: state <= 4;
            endcase
        end
    end
                
    assign shift_ena = (state==0) | (state==1) | (state==2) | (state==3);

endmodule
