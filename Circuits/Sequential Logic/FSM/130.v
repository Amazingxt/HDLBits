module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    reg [5:0] state, next_state;
    parameter
    	Left = 6'b000001, Right = 6'b000010, left_Dig = 6'b000100, right_Dig = 6'b001000, left_Fall = 6'b010000, right_Fall = 6'b100000;
    
    always @ (posedge clk or posedge areset) begin
        if (areset)
            state <= Left;
        else
            state <= next_state;
    end
    
    always @ (*) begin
        case (state)
            Left: begin
                if (~ground)
                    next_state = left_Fall;
                else
                    next_state = dig?left_Dig:(bump_left?Right:Left);
            end
            
            Right: begin
                if (~ground)
                    next_state = right_Fall;
                else
                    next_state = dig?right_Dig:(bump_right?Left:Right);
            end
            
            left_Dig: begin
                if (~ground)
                    next_state = left_Fall;
                else
                    next_state = left_Dig;
            end
            
            right_Dig: begin
                if (~ground)
                    next_state = right_Fall;
                else
                    next_state = right_Dig;
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
    
    assign walk_left = (state==Left);
    assign walk_right = (state==Right);
    assign aaah = (state==left_Fall) | (state==right_Fall);
    assign digging = (state==left_Dig) | (state==right_Dig);

endmodule

// 仿顺序操作
// module top_module(
//     input clk,
//     input areset,    // Freshly brainwashed Lemmings walk left.
//     input bump_left,
//     input bump_right,
//     input ground,
//     input dig,
//     output walk_left,
//     output walk_right,
//     output aaah,
//     output digging ); 

//     reg [5:0] state;
//     parameter
//     	Left=6'b000001, Right=6'b000010, Right_full=6'b000100, Left_full=6'b001000, Right_dig=6'b010000, Left_dig=6'b100000;
    
//     always @(posedge clk or posedge areset) begin
//         if (areset) 
//             state <= Left;
//         else begin
//             case (state)
//                 Left: begin
//                     if (ground==0) 
//                         state <= Left_full;
//                 	else begin
//                         if (dig==1)
//                             state <= Left_dig;
//                         else begin
//                             if (bump_left==1)
//                                 state <= Right;
//                             else
//                                 state <= Left;
//                         end
//                     end
//                 end
//                 Right: begin
//                     if (ground==0)
//                         state <= Right_full;
//                 	else begin
//                         if (dig==1)
//                             state <= Right_dig;
//                         else begin
//                             if (bump_right==1)
//                                 state <= Left;
//                             else
//                                 state <= Right;
//                         end
//                     end
//                 end         
//                 Left_full: begin
//                     if (ground==0) 
//                         state <= Left_full;
//                     else begin
//                         state <= Left;
//                     end
//                 end
//                 Right_full: begin
//                     if (ground==0)
//                         state <= Right_full;
//                     else begin
//                         state <= Right;
//                     end
//                 end
//                 Left_dig: begin
//                     if (ground==0)
//                         state <= Left_full;
//                     else 
//                         state <= Left_dig;
//                 end
//                 Right_dig: begin
//                     if (ground==0)
//                         state <= Right_full;
//                     else 
//                         state <= Right_dig;
//                 end
//             endcase
//         end
//     end
    
//     assign walk_left = (state==Left)?1:0;
//     assign walk_right = (state==Right)?1:0;
//     assign aaah = (state==Left_full) | (state==Right_full);
//     assign digging = (state==Left_dig) | (state==Right_dig);
                            
// endmodule
