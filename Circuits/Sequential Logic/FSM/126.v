module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    reg [3:0] state, next_state;
    parameter
    	A=4'b0001,
    	B=4'b0010,
    	C=4'b0100,
    	D=4'b1000;
    
    always @ (*) begin
        case (state)
            A: next_state = (in==0)?A:B;
            B: next_state = (in==0)?C:B;
            C: next_state = (in==0)?A:D;
            D: next_state = (in==0)?C:B;
        endcase
    end
    // State transition logic
    always @ (posedge clk) begin
        if (reset)
            state = A;
    	else
            state = next_state;
    end
    // State flip-flops with synchronous reset
    assign out = (state==D)?1:0;
    // Output logic

endmodule
