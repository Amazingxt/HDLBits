module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    reg [2:0] state;
    always @(posedge clk) begin
        if (reset)
            state <= A;
        else begin
            case (state)
                A: state <= w?A:B;
                B: state <= w?D:C;
                C: state <= w?D:E;
                D: state <= w?A:F;
                E: state <= w?D:E;
                F: state <= w?D:C;
            endcase
        end
    end
    assign z = (state==E) | (state==F);
                    
endmodule
