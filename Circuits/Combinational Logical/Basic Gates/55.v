module top_module (input x, input y, output z);

    wire z1, z2, z3, z4;
    A A1 (x, y, z1);
    A A2 (x ,y, z2);
    B B1 (x, y, z3);
    B B2 (x, y, z4);
    
    assign z = (z2&z4) ^ (z1|z3);
    
    
endmodule

module A (input x, input y, output z);

    assign z = (x^y)&x;
endmodule

module B ( input x, input y, output z );
    assign z = (~x & ~y) | (x&y);

endmodule
