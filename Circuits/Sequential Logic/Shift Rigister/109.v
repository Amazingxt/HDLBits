module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    reg [63:0] temp;
    always @ (posedge clk) begin
        if (load)
            q <= data;
        else 
            begin
                if (ena)
                    case (amount)
                        2'b00: q <= q<<1;
                        2'b01: q <= q<<8;
                        2'b10: begin
                            temp = q >> 1;
                            q = {q[63],temp[62:0]};
                        end
                        2'b11: begin
                            temp = q >> 8;
                            q = {{8{q[63]}}, temp[55:0]};
                        end
                    endcase
            end
    end

endmodule
