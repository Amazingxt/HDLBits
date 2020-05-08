module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] q0, q1, q2, q3;
    bcd bcd0 (clk, 1'b1, reset, q0);
    bcd bcd1 (clk, ena[1], reset, q1);
    bcd bcd2 (clk, ena[2], reset, q2);
    bcd bcd3 (clk, ena[3], reset, q3);
    
    assign ena = {(q2==4'd9) && (q1==4'd9) && (q0==4'd9),(q1==4'd9) && (q0==4'd9),q0==4'd9};
    assign q = {q3, q2, q1, q0};

endmodule


module bcd (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always @ (posedge clk) begin
        if (reset)
            q = 0;
        else
            begin
            	if (slowena)
                	begin
                		q = q + 1;
                        if (q>9)
                            q = 0;
                    end
            end
    end
                        
        	
endmodule
