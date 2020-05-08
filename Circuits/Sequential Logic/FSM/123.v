module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @ (*) begin
        case (state)
            A: next_state = (in==0)?A:B;
            B: next_state = (in==0)?C:B;
            C: next_state = (in==0)?A:D;
            D: next_state = (in==0)?C:B;
        endcase
    end
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state==D)?1:0;

endmodule

// 仿顺序操作
// module top_module(
//     input in,
//     input [1:0] state,
//     output [1:0] next_state,
//     output out); //

//     always @(*) begin
        
//         case (state)
//             2'b00: 
//                 if (in) begin
//                     next_state <= 2'b01;
//                     out <= 0;
//                 end
//             	else begin
//                     next_state <= 2'b00;
//                     out <= 0;
//                 end

//             2'b01: 
//                 if (in) begin
//                     next_state <= 2'b01;
//                     out <= 0;
//                 end
//                 else begin
//                     next_state <= 2'b10;
//                     out <= 0;
//             	end
            
//             2'b10: 
//                 if (in) begin
//                     next_state <= 2'b11;
//                     out <= 0;
//                 end
//                 else begin
//                     next_state <= 2'b00;
//                     out <= 0;
//             	end
            
//             2'b11: 
//                 if (in) begin
//                     next_state <= 2'b01;
//                     out <= 1;
//                 end
//                 else begin
//                     next_state <= 2'b10;
//                     out <= 1;    
//             	end
//         endcase
//     end

// endmodule
