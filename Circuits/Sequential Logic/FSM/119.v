module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case (state)
            A: if (in)
                   next_state = A;
               else
                   next_state = B;
            B: if (in)
                   next_state = B;
               else
                   next_state = A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == A)? 0:1;

endmodule

// another method 仿顺序操作
// module top_module(
//     input clk,
//     input areset,    // Asynchronous reset to state B
//     input in,
//     output out);//  

//     reg i;
    
//     always @(posedge clk, posedge areset) begin
        
//         if (areset) begin
//             out <= 1;
//             i <= 1'b0;
//         end	
//         else 
//             case (i)
//                 1'b0: begin
//                     if (in) begin
//                         out <= 1;
//              			i <= 1'b0;
//                     end
//                     else begin
//                         out <= 0;
//                         i <= 1'b1;
//                     end
//                 end
//                 1'b1: begin
//                     if (in) begin
//                         i <= 1'b1;
//                         out <= 0;
//                     end
//                     else begin
//                         out <= 1;
//                         i <= 1'b0;
//                     end
//                 end
//             endcase
//     end
// endmodule
