module top_module();
    
    reg [1:0] in_test;
    reg out;
    initial
        begin
            in_test[0] = 0;
            in_test[1] = 0;
            #10;
            in_test[0] = 1;
            in_test[1] = 0;
            #10;
            in_test[0] = 0;
            in_test[1] = 1;
            #10;
            in_test[0] = 1;
            in_test[1] = 1;
            #10;
        end
    andgate andgate1 (in_test, out);

endmodule
