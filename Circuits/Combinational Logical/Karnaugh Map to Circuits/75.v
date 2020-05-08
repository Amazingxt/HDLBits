module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (a&c) | (~a&~b&c) | (~c&~d&a);
endmodule
