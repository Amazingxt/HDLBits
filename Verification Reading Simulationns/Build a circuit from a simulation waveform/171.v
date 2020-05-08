module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    
    always @(clock) begin
        if (clock)
            p = a;
        else
            p = p;
    end
    
    always @(negedge clock) begin
        if (a)
        	q = 1;
        else
            q = 0;
    end
    

endmodule
