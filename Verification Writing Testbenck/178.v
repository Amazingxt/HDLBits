module top_module ();
    
    reg reset;
    reg clk;
    reg t;
    reg out;
    initial 
        begin
            reset = 1'bz;
            #10;
            reset = 1;
            #10;
            reset = 0;
            t=1;
            #50;
        end
    always
        begin
            clk=0;
            #5;
            clk=1;
            #5;
        end
    tff tff1 (clk,reset,t,out);

endmodule
