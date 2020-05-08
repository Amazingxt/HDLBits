module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    reg [511:0] temp;
    always @ (posedge clk) begin
        if (load)
            begin
                q <= data;
                temp <= data;
            end
        else
            begin
                temp = ~(temp>>1)&temp | temp&~(temp<<1) | ~temp&(temp<<1);
                q = temp;
            end
    end

endmodule
