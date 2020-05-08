module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [7:0] state, next_state;
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
    
    assign done = (state==Dn);

endmodule

//仿顺序操作
// module top_module(
//     input clk,
//     input in,
//     input reset,    // Synchronous reset
//     output done
// ); 
    
//     reg [31:0] state;
//     always @(posedge clk) begin
//         if (reset) 
//             state <= 0;
//         else begin
//             case (state)
//                 0: begin
//                     if (in==0)
//                         state <= 1;
//                     else
//                         state <= 0;
//                 end
//                 1,2,3,4,5,6,7,8: 
//                     state <= state + 1;
//                 9: begin
//                     if (in==1)
//                         state <= 10;
//                     else
//                         state <= 11;
//                 end
//                 10: begin
//                     if (in==0)
//                         state <=1;
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

// endmodule
