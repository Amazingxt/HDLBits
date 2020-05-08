
module top_module ( );
    
    localparam period=5;
    reg clk;
    always
        begin
            clk = 0;
            #period;
            clk = 1;
            #period;
        end
    
    dut dut1 (clk);

endmodule
