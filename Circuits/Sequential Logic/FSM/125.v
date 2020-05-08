module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    reg [3:0] state, next_state;
    parameter
    	A = 4'b0001,
    	B = 4'b0010,
    	C = 4'b0100,
    	D = 4'b1000;
    // State transition logic
    always @ (*) begin
        case (state)
            A: next_state=(in==0)?A:B;
            B: next_state=(in==0)?C:B;
            C: next_state=(in==0)?A:D;
            D: next_state=(in==0)?C:B;
        endcase
    end
    // State flip-flops with asynchronous reset
    always @ (posedge clk or posedge areset) begin
        if (areset)
            state = A;
        else
            state = next_state;
    end
    // Output logic
    assign out = (state==D)?1:0;

endmodule
