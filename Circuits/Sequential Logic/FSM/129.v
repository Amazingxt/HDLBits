module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    reg [3:0] state, next_state;
    parameter
    	Left = 4'b0001, Right = 4'b0010, left_Fall = 4'b0100, right_Fall = 4'b1000;
    
    always @ (*) begin
        case (state)
            Left: begin
                if (~ground)
                    next_state = left_Fall;
                else
                    next_state = (bump_left==1)?Right:Left;
            end
            Right: begin
                if (~ground)
                    next_state = right_Fall;
                else
                    next_state = (bump_right==1)?Left:Right;
            end
            left_Fall: begin
                if (~ground)
                    next_state = left_Fall;
                else
                    next_state = Left;
            end
            right_Fall: begin
                if (~ground)
                    next_state = right_Fall;
                else
                    next_state = Right;
            end
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if (areset)
            state <= Left;
        else
            state <= next_state;
    end
    
    assign walk_left = (state==Left);
    assign walk_right = (state==Right);
    assign aaah = (state==left_Fall) | (state==right_Fall);
                

endmodule

// 仿顺序操作
// module top_module(
//     input clk,
//     input areset,    // Freshly brainwashed Lemmings walk left.
//     input bump_left,
//     input bump_right,
//     input ground,
//     output walk_left,
//     output walk_right,
//     output aaah ); 
    
//     reg [1:0] state;
    
//     always @(posedge clk or posedge areset) begin
//         if (areset) begin
//             state <= 2'b00;
//         end
//         else begin
//             case (state)
//                 2'b00:
//                     if (ground==0) begin
//                         state <= 2'b01;
//                     end
//                 	else begin
//                         if (bump_left==1) begin
//                             state <= 2'b10;
//                         end
//                         else begin
//                             state <= 2'b00;
//                         end
//                     end
//                 2'b10:
//                     if (ground==0) begin
//                         state <= 2'b11;
//                     end
//                 	else begin
//                         if (bump_right==1) begin
//                             state <= 2'b00;
//                         end
//                         else begin
//                             state <= 2'b10;
//                         end
//                     end
//                 2'b01:
//                     if (ground==0) begin
//                         state <= 2'b01;
//                     end
//                 	else begin
//                         state <= 2'b00;
//                     end
//                 2'b11:
//                     if (ground==0) begin
//                         state <= 2'b11;
//                     end
//                 	else begin
//                         state <= 2'b10;
//                     end    
//             endcase
//         end
//     end
    
//     assign walk_left = (state==2'b00)?1:0;
//     assign walk_right = (state==2'b10)?1:0;
//     assign aaah = (state==2'b01) | (state==2'b11);
// endmodule
