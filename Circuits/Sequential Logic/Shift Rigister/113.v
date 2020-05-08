module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q0, q1, q2;
    dff dff1 (clk, in, resetn, q0);
    dff dff2 (clk, q0, resetn, q1);
    dff dff3 (clk, q1, resetn, q2);
    dff dff4 (clk, q2, resetn, out);
endmodule

module dff (
    input clk,
    input in,
    input reset,
    output out
);
    always @ (posedge clk) begin
        if (reset)
            out <= 0;
        else
            out <= in;
    end
endmodule
