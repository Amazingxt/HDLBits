module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    example exp1 (LEDR[2], SW[0], KEY[1], KEY[0], LEDR[0]);
    example exp2 (LEDR[0], SW[1], KEY[1], KEY[0], LEDR[1]);
    example exp3 ((LEDR[2]^LEDR[1]), SW[2], KEY[1], KEY[0], LEDR[2]);

endmodule

module example (
    input in1,
    input in2,
    input sel,
    input clk,
    output out
);
    always @ (posedge clk) begin
        if (sel)
            out <= in2;
        else
            out <= in1;
    end
endmodule
