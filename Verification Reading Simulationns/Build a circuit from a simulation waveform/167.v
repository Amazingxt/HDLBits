module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = ({a,b,c,d}==2) | ({a,b,c,d}==3) | ({a,b,c,d}==4) | ({a,b,c,d}==5) | ({a,b,c,d}==6) | ({a,b,c,d}==7) | ({a,b,c,d}==2) | ({a,b,c,d}==10) | ({a,b,c,d}==11) | ({a,b,c,d}==12) | ({a,b,c,d}==13) | ({a,b,c,d}==14) | ({a,b,c,d}==15); // Fix me

endmodule
