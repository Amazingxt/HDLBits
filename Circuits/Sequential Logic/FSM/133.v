module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    reg [3:0] state, next_state;
    reg [31:0] counter;
    parameter
    	B1 = 4'b0001, B2 = 4'b0010, B3 = 4'b0100, Dn = 4'b1000;
    // State transition logic (combinational)
    always @ (*) begin
        case (state)
            B1: next_state = (in[3])?B2:B1;
            B2: next_state = B3;
            B3: next_state = Dn;
            Dn: next_state = (in[3])?B2:B1;
        endcase
    end

    // State flip-flops (sequential)
    always @ (posedge clk) begin
        if (reset)
            state <= B1;
        else 
            state <= next_state;
    end
 
    // Output logic
    assign done = (state==Dn);

endmodule

//仿顺序操作
// module top_module(
//     input clk,
//     input [7:0] in,
//     input reset,    // Synchronous reset
//     output done); //

//     reg [2:0] state;
    
//     always @(posedge clk) begin
//         if (reset) 
//             state <= 2'b00;
//         else begin
//             case (state)
//                 2'b00: begin
//                     if (in[3]==1'b1)
//                         state <= 2'b01;
//                 	else
//                         state <= 2'b00;
//                 end
//                 2'b01:
//                     state <= 2'b10;
//                 2'b10:
//                     state <= 2'b11;
//                 2'b11: begin
//                     if (in[3]==1'b1)
//                         state <= 2'b01;
//                     else
//                     	state <= 2'b00;
//                 end
//             endcase
//         end
//     end
        
//     assign done = (state==2'b11)?1:0;
//     // State transition logic (combinational)

//     // State flip-flops (sequential)
 
//     // Output logic

// endmodule
