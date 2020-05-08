module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF dff1 (KEY[3], SW[3], KEY[0], KEY[1], KEY[2], LEDR[3]);
    MUXDFF dff2 (LEDR[3], SW[2], KEY[0], KEY[1], KEY[2], LEDR[2]);
    MUXDFF dff3 (LEDR[2], SW[1], KEY[0], KEY[1], KEY[2], LEDR[1]);
    MUXDFF dff4 (LEDR[1], SW[0], KEY[0], KEY[1], KEY[2], LEDR[0]);

endmodule

module MUXDFF (
    input in2,
    inout in3,
    input clk,
    input sel1,
    input sel2,
    output out
);
    
    always @ (posedge clk) begin
        case ({sel1, sel2})
            2'b00: out <= out;
            2'b01: out <= in3;
            2'b10: out <= in2;
            2'b11: out <= in3;
        endcase
    end

endmodule
