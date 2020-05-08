// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter 
    	A = 0,
    	B = 1;

    reg present_state, next_state;

    always @(posedge clk) 
        begin
        if (reset) 
            begin  
            // Fill in reset logic
            present_state = B;
        	end 
        else 
            begin
                case (present_state)
                    // Fill in state transition logic
                    A: next_state = in?A:B;
                    B: next_state = in?B:A;
                endcase

                // State flip-flops
                present_state = next_state;   
        	end
            
        
        case (present_state)
                    // Fill in output logic
                    A: out <= 0;
                    B: out <= 1;
        endcase
    	end

endmodule

// 仿顺序操作
// Note the Verilog-1995 module declaration syntax here:
// module top_module(clk, reset, in, out);
//     input clk;
//     input reset;    // Synchronous reset to state B
//     input in;
//     output out;//  
//     reg out;

//     // Fill in state name declarations

//     reg i;
//     always @(posedge clk) begin
//         if (reset) begin
//             i <= 1'b0;
//             out <= 1;
//         end
//     	else begin
//             case (i)
//                 1'b0:
//                     if (in) begin
//                         i <= 1'b0;
//                         out <=1;
//                     end
//                 	else begin
//                         i <= 1'b1;
//                         out <=0;
//                     end
//                 1'b1:
//                     if (in) begin
//                         i <= 1'b1;
//                         out <= 0;
//                     end
//                 	else begin
//                         i <= 1'b0;
//                         out <= 1;
//                     end
//             endcase
//         end
//     end

// endmodule