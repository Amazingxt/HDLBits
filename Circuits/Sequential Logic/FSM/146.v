module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    parameter A=6'b000001, B=6'b000010, C=6'b000100, D=6'b001000, E=6'b010000, F=6'b100000;
    
    assign Y2 = ((y[1])&(w==0))?1:0;
    assign Y4 = ((y[2])&(w==1) | (y[3])&(w==1) | (y[5])&(w==1) | (y[6])&(w==1))?1:0;

endmodule
