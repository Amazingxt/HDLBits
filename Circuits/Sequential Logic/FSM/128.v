module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    // parameter LEFT=0, RIGHT=1, ...
    parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case (state)
            LEFT: next_state = (bump_left==1)?RIGHT:LEFT;
            RIGHT: next_state = (bump_right==1)?LEFT:RIGHT;
        endcase
            
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset)
            state = LEFT;
        else
            state = next_state;
    end

    // Output logic
    // assign walk_left = (state == ...);
    // assign walk_right = (state == ...);
    assign walk_left = (state==LEFT)?1:0;
    assign walk_right = (state==RIGHT)?1:0;

endmodule

// 仿顺序操作
// module top_module(
//     input clk,
//     input areset,    // Freshly brainwashed Lemmings walk left.
//     input bump_left,
//     input bump_right,
//     output walk_left,
//     output walk_right); //  

// 	reg i;
//     always @(posedge clk or posedge areset) begin
//         if (areset) begin
//             i <= 1'b0;
//             walk_right <= 0;
//             walk_left <= 1;
//         end
        
//         else begin
//             case (i)
//                 1'b0:
//                     if (bump_left==1) begin
//                         i <= 1'b1;
//                         walk_left <= 0;
//                         walk_right <= 1;
//                     end
//                 	else begin
//                         i <= 1'b0;
//                         walk_left <= 1;
//                         walk_right <= 0;
//                     end
//                 1'b1:
//                     if (bump_right==1) begin
//                         i <= 1'b0;
//                         walk_left <= 1;
//                         walk_right <= 0;
//                     end
//                 	else begin
//                         i <= 1'b1;
//                         walk_left <= 0;
//                         walk_right <= 1;
//                     end    
//             endcase
//         end
//     end
// endmodule
