module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    
    reg [2:0] state;
    always @(posedge clk) begin
        if (reset)
            state <= A;
        else begin
            case (state)
                A: state <= w?B:A;
                B: state <= w?C:D;
                C: state <= w?E:D;
                D: state <= w?F:A;
                E: state <= w?E:D;
                F: state <= w?C:D;
            endcase
        end
    end
    
    assign z = (state==E | state==F)?1:0;
                    
            
endmodule
