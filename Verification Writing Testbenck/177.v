module top_module();
    
    reg clk;
    reg in;
    reg out;
    reg [2:0] s;
    
    initial
        begin
            in=0;
            s=2;
            #10;
            in=0;
            s=6;
            #10;
            in=1;
            s=2;
            #10;
            in=0;
            s=7;
            #10;
            s=0;
            in=1;
            #30;
            s=0;
            in=0;
            #10;
        end
    
    always
        begin
            clk=0;
            #5;
            clk=1;
            #5;
        end
    q7 q (clk, in, s, out);

endmodule
