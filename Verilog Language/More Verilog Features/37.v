
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    reg [7:0] temp1,temp2,temp3;
    // assign intermediate_result1 = compare? true: false;
    assign temp1 = (a<b)?a:b;
    assign temp2 = (c<temp1)?c:temp1;
    assign temp3 = (d<temp2)?d:temp2;
    assign min = temp3;

endmodule
