module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A=4'b0000, B=4'b0001, C=4'b0010, D=4'b0011, E=4'b0100, F=4'b0101, G=4'b0110, H=4'b0111, I=4'b1000;
    reg [3:0] state;
    always @(posedge clk) begin
        if (~resetn)
            state <= A;
        else begin
            case (state)
                A: state <= B;
                B: state <= C;
                C: begin
                    if (x==1)
                        state <= D;
                    else
                        state <= C;
                end
                D: begin
                    if (x==0)
                        state <= E;
                    else
                        state <= D;
                end
                E: begin
                    if (x==1)
                        state <= F;
                    else
                        state <= C;
                end
                F: begin
                    if (y==1)
                        state <= H;
                    else
                        state <= G;
                end
                G: begin
                    if (y==1)
                        state <= H;
                    else
                        state <= I;
                end
                H: state <= H;
                I: state <= I;
            endcase
        end
    end
    
    assign f = (state==B)?1:0;
    assign g = (state==F) | (state==H) | (state==G);

endmodule
