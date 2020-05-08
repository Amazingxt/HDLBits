module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    reg [23:0] datapath;
    reg [3:0] state, next_state;
    parameter
    	B1 = 4'b0001, B2 = 4'b0010, B3 = 4'b0100, Dn = 4'b1000;
    
    always @ (*) begin
        case (state)
            B1: next_state = in[3]?B2:B1;
            B2: next_state = B3;
            B3: next_state = Dn;
            Dn: next_state = in[3]?B2:B1;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset)
            state = B1;
        else
            state = next_state;
    end
    
    always @ (posedge clk) begin
        if (reset)
            datapath = 32'b0;
        else
            begin
                datapath[23:16] = datapath[15:8];
                datapath[15:8] = datapath[7:0];
                datapath[7:0] = in;
            end
    end
    
    assign done = (state==Dn);
    assign out_bytes = (state==Dn)?datapath:32'b0;
            
    // FSM from fsm_ps2

    // New: Datapath to store incoming bytes.

endmodule

//仿顺序操作
// module top_module(
//     input clk,
//     input [7:0] in,
//     input reset,    // Synchronous reset
//     output [23:0] out_bytes,
//     output done); //

//     reg [3:0] state;
//     always @(posedge clk) begin
//         if (reset) 
//             state <= 0;
//         else begin
//             case (state)
//                 0: begin
//                     if (in[3]==1) begin
//                         state <= 1;
//                         out_bytes[23:16] = in[7:0];
//                     end
//                     else
//                         state <= 0;
//                 end
//                 1: begin
//                     out_bytes[15:8] = in[7:0];
//                     state <= 2;
//                 end
//                 2: begin
//                     out_bytes[7:0] = in[7:0];
//                     state <= 3;
//                 end
//                 3: begin
//                     if (in[3]==1) begin
//                         out_bytes[23:16] = in[7:0];
//                         state <= 1;
//                     end
//                     else
//                         state <= 0;
//                 end
//             endcase
//         end
//     end
    
//     assign done = (state==3)?1:0;
                    
//     // FSM from fsm_ps2

//     // New: Datapath to store incoming bytes.

// endmodule
