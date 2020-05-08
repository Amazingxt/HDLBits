module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    
    assign Y2 = ((y==B)&(w==0) | (y==F)&(w==0) | (y==B)&(w==1) | (y==C)&(w==1) | (y==E)&(w==1) | (y==F)&(w==1))?1:0;

endmodule
