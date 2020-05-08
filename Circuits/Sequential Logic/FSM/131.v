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
    
    reg [6:0] state, next_state;
    reg [31:0] counter;
    
    parameter
    	Left = 7'b0000001, Right = 7'b0000010, left_Dig = 7'b0000100, right_Dig = 7'b0001000, left_Fall = 7'b0010000, right_Fall = 7'b0100000, Splat = 7'b1000000;
    
    always @ (posedge clk or posedge areset) begin
        if (areset)
            state <= Left;
        else
            begin
            	state <= next_state;
                if (state==left_Fall | state==right_Fall)
                    counter <= counter + 1;
                else
                    counter <= 0;
            end
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
                if (~ground) begin
                    next_state = left_Fall;
                end
                else
                    next_state = (counter>19)?Splat:Left;
            end
            
            right_Fall: begin
                if (~ground) begin
                    next_state = right_Fall;
                end
                else
                    next_state = (counter>19)?Splat:Right;
            end
            
            Splat: begin
                if (areset)
                    next_state = Left;
                else
                    next_state = Splat;
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
//     reg [31:0] count;
//     parameter
//     	Left=7'b0000001, Right=7'b0000010, Left_full=7'b0000100, Right_full=7'b0001000, Left_dig=7'b0010000, Right_dig=7'b0100000, Dead=7'b1000000;
    
//     always @(posedge clk or posedge areset) begin
//         if (areset) begin
//             count <= 0;
//             state <= Left;
//         end
//         else begin
//             case (state)
//                 Left: begin
//                     if (ground==0)
//                         state <= Left_full;
//                     else begin
//                         if (dig==1)
//                             state <= Left_dig;
//                         else begin
//                             if (bump_left==1)
//                         		state <= Right;
//                             else
//                                 state <= Left;
//                         end
//                     end
//                 end
//                 Right: begin
//                     if (ground==0)
//                         state <= Right_full;
//                     else begin
//                         if (dig==1)
//                             state <= Right_dig;
//                         else begin
//                             if (bump_right==1)
//                                 state <= Left;
//                             else
//                                 state <= Right;
//                             end
//                     end
//                 end
//                 Left_full: begin
//                     if (ground==0) begin
//                         count <= count + 1;
//                         state <= Left_full;
//                     end
//                     else begin
//                         if (count>19)
//                             state <= Dead;
//                         else begin
//                             count <= 0;
//                         	state <= Left;
//                         end
//                     end
//                 end
//                 Right_full: begin
//                     if (ground==0) begin
//                         count <= count + 1;
//                         state <= Right_full;
//                     end
//                     else begin 
//                         if (count>19)
//                             state <= Dead;
//                         else begin
//                         	count <= 0;
//                             state <= Right;
//                         end
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
//                 Dead:
//                     state <= Dead;
//             endcase
//         end
//     end
    
//     assign walk_left = (state==Left)?1:0;
//     assign walk_right = (state==Right)?1:0;
//     assign aaah = (state==Left_full) | (state==Right_full);
//     assign digging = (state==Left_dig) | (state==Right_dig);
    
                          
// endmodule
