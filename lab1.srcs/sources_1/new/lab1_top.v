`timescale 1ns / 1ps

module lab1_top(
    input [15:0] sw,
    input btnL,
    input btnR,
    output [15:0] LED,
    output [6:0] seg,
    output [3:0] an
    );
    
    assign LED[3:0] = sw[11:8] + sw[15:12];
    assign LED[7:4] = sw[11:8] | sw[15:12];
    
    // TODO: Box number
    
    seven_seg(
        .A (sw[3:0]),
        .B (sw[7:4]),
        .C (sw[11:8]),
        .D (sw[15:12]),
        .SEL1 (btnL),
        .SEL2 (btnR),
        .seg (seg), 
        .an (an)
    );
    
endmodule
