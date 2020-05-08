module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    reg [5:0] state;
    reg [3:0] delay;
    reg [31:0] counter;
    always @(posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            case (state)
                0: begin
                    delay <= 0;
                    if (data==1)
                        state <= 1;
                    else
                        state <= 0;
                end
                1: begin
                    if (data==1)
                        state <= 2;
                    else
                        state <= 0;
                end
                2: begin
                    if (data==0)
                        state <= 3;
                    else
                        state <= 2;
                end
                3: begin
                    if (data==1)
                        state <= 4;
                    else
                        state <= 0;
                end
                4: begin
                    delay[3:0] <= {delay[2:0],data};
                    state <= 5;
                end
                5: begin
                    delay[3:0] <= {delay[2:0],data};
                    state <= 6;
                end
                6: begin
                    delay[3:0] <= {delay[2:0],data};
                    state <= 7;
                end
                7: begin
                    delay[3:0] <= {delay[2:0],data} + 1;
                    state <= 8;
                    counter <= 0;
                end
                8: begin
                    if (counter<999) begin
                        state <= 8;
                        counter <= counter + 1;
                    end
                    else begin
                        if (delay==1)
                            state <= 9;
                        else begin
                            delay <= delay - 1;
                            state <= 8;
                            counter <= 0;
                        end
                    end
                end
                9: begin
                    if (ack==1)
                        state <= 0;
                    else
                        state <= 9;
                end
            endcase
        end
    end
    
    assign done = (state==9);
    assign counting = (state==8);
    assign count = delay - 1;
    
endmodule
