module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    reg [7:0] state, next_state;
    reg [9:0] datapath;
    parameter
    	B1=0, B2=1, B3=2, B4=3, B5=4, B6=5, B7=6, B8=7, stop=8, Dn=9, start=10, idle=11;
    
    always @ (*) begin
        case (state)
            start: next_state = in?start:B1;
            B1: next_state = B2;
            B2: next_state = B3;
            B3: next_state = B4;
            B4: next_state = B5;
            B5: next_state = B6;
            B6: next_state = B7;
            B7: next_state = B8;
            B8: next_state = stop;
            stop: next_state = in?Dn:idle;
            idle: next_state = in?start:idle;
            Dn: next_state = in?start:B1;
		endcase
    end
    
    always @ (posedge clk) begin
        if (reset)
            state <= start;
        else
            state <= next_state;
    end
    
    always @ (posedge clk) begin
        datapath[0] <= datapath[1];
        datapath[1] <= datapath[2];
        datapath[2] <=datapath[3];
        datapath[3] <=datapath[4];
        datapath[4] <=datapath[5];
        datapath[5] <=datapath[6];
        datapath[6] <=datapath[7];
        datapath[7] <=datapath[8];
        datapath[8] <=datapath[9];
        datapath[9] <= in;
    end
    
    assign done = (state==Dn);
    assign out_byte = (state==Dn)?datapath[8:1]:7'b0;

endmodule

//仿顺序操作
// module top_module(
//     input clk,
//     input in,
//     input reset,    // Synchronous reset
//     output [7:0] out_byte,
//     output done
// ); //

//     reg [31:0] state;
//     always @(posedge clk) begin
//         if (reset)
//             state <= 0;
//         else begin
//             case (state)
//                 0: begin
//                     if (in==0) begin
//                         state <= 1;
//                     end
//                     else
//                         state <= 0;
//                 end
//                 1: begin
//                     out_byte[0] = in;
//                     state <= state + 1;
//                 end
//                 2: begin
//                     out_byte[1] = in;
//                     state <= state + 1;
//                 end
//                 3: begin
//                     out_byte[2] = in;
//                     state <= state + 1;
//                 end
//                 4: begin
//                     out_byte[3] = in;
//                     state <= state + 1;
//                 end
//                 5: begin
//                     out_byte[4] = in;
//                     state <= state + 1;
//                 end
//                 6: begin
//                     out_byte[5] = in;
//                     state <= state + 1;
//                 end
//                 7: begin
//                     out_byte[6] = in;
//                     state <= state + 1;
//                 end
//                 8: begin
//                     out_byte[7] = in;
//                     state <= state + 1;
//                 end
//                 9: begin
//                     if (in==1)
//                         state <= 10;
//                     else
//                         state <= 11;
//                 end
//                 10: begin
//                     if (in==0)
//                         state <= 1;
//                     else
//                         state <= 0;
//                 end
//                 11: begin
//                     if (in==1)
//                         state <= 0;
//                     else
//                         state <= 11;
//                 end
//             endcase
//         end
//     end
    
//     assign done = (state==10)?1:0;
                         
//     // Use FSM from Fsm_serial

//     // New: Datapath to latch input bits.

// endmodule
