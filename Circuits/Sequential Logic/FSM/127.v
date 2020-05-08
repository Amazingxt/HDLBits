module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    reg [1:0] i;
    
    always @(posedge clk) begin
        if (reset) begin
            i <= 2'b00;
            {fr3,fr2,fr1,dfr} <= 4'b1111;
        end
        else begin
            case (i)
                2'b00:
                    if (s==3'b000) begin
                        i <= 2'b00;
                        {fr3,fr2,fr1,dfr} <= 4'b1111;   
                    end
                	else begin
                        if (s==3'b001) begin
                            i <= 2'b01;
                            {fr3,fr2,fr1,dfr} <= 4'b0110; 
                        end
                    end
                2'b01:
                    if (s==3'b000) begin
                        i <= 2'b00;
                        {fr3,fr2,fr1,dfr} <= 4'b1111; 
                    end
                	else begin
                        if (s==3'b001) begin
                            i <= 2'b01;
                            {fr3,fr2,fr1} <= 3'b011;
                        end
                        else begin
                            if (s==3'b011) begin
                                i <= 2'b10;
                                {fr3,fr2,fr1,dfr} <= 4'b0010; 
                            end
                        end
                    end
                2'b10:
                    if (s==3'b001) begin
                        i <= 2'b01;
                        {fr3,fr2,fr1,dfr} <= 4'b0111; 
                    end
                	else begin
                        if (s==3'b011) begin
                            i <= 2'b10;
                            {fr3,fr2,fr1} <= 3'b001;
                        end
                        else begin
                            if (s==3'b111) begin
                                i <= 2'b11;
                                {fr3,fr2,fr1,dfr} <= 4'b0000; 
                            end
                        end
                    end
                2'b11:
                    if (s==3'b011) begin
                        i <= 2'b10;
                        {fr3,fr2,fr1,dfr} <= 4'b0011; 
                    end
                	else begin
                        if (s==3'b111) begin
                            i <= 2'b11;
                            {fr3,fr2,fr1,dfr} <= 4'b0000;
                        end
                    end
            endcase
        end
    end
        
endmodule
