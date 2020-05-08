module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case (state)
            OFF: next_state = (j==0)?OFF:ON;
            ON: next_state = (k==0)?ON:OFF;
        endcase
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if (reset)
            state = OFF;
        else
            state = next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state==OFF)?0:1;

endmodule

// 仿顺序操作
// module top_module(
//     input clk,
//     input reset,    // Synchronous reset to OFF
//     input j,
//     input k,
//     output out); //  

// 	reg i;
    
//     always @(posedge clk) begin
//         if (reset) begin
//             i <= 1'b0;
//             out <= 0;
//         end
        
//         else begin
//             case (i)
//                 1'b0:
//                     if (j) begin
//                         i <= 1'b1;
//                         out <= 1;
//                     end
//                     else begin
//                         i <= 1'b0;
//                         out <= 0;
//                     end
//                 1'b1:
//                     if (k) begin
//                         i <= 1'b0;
//                         out <= 0;
//                     end
//                 	else begin
//                         i <= 1'b1;
//                         out <= 1;
//                     end
//             endcase
//         end
//     end
                
        

// endmodule
