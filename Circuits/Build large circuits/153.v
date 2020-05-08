module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always @(posedge clk) begin
        if (shift_ena)
            q[3:0] <= {q[2:0],1'b0} + data;
        else begin
            if (count_ena)
                q <= q-1;
        end
    end
            
endmodule
