`timescale 1ns / 1ps

module seven_seg(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input SEL1,
    input SEL2,
    output reg [6:0] seg,
    output [3:0] an
    );

    // To turn on seg 1, we would put the annode for that led DOWN, so 1110
    assign an = {SEL1 | SEL2, ~SEL1 | SEL2, SEL1 | ~SEL2, ~SEL1 | ~SEL2};
    
    // If we combine these we can case match on them, which simplifies things
    wire [1:0] sel;
    assign sel = {SEL1, SEL2};
    
    reg [3:0] n; // which of A,B,C,D we want to display 
  
    
    always @(*)
    begin
        case (sel)
            2'b00: n = A;
            2'b01: n = B;
            2'b10: n = C;
            2'b11: n = D;
        endcase
        case (n)
            4'b0000: seg = 7'b1000000; // "0"  
            4'b0001: seg = 7'b1111001; // "1" 
            4'b0010: seg = 7'b0100100; // "2" 
            4'b0011: seg = 7'b0110000; // "3" 
            4'b0100: seg = 7'b0011001; // "4" 
            4'b0101: seg = 7'b0010010; // "5" 
            4'b0110: seg = 7'b0000010; // "6" 
            4'b0111: seg = 7'b1111000; // "7" 
            4'b1000: seg = 7'b0000000; // "8"  
            4'b1001: seg = 7'b0011000; // "9" 
            4'b1010: seg = 7'b0001000; // "A" 
            4'b1011: seg = 7'b0000011; // "b" 
            4'b1100: seg = 7'b1000110; // "c" 
            4'b1101: seg = 7'b0100001; // "d" 
            4'b1110: seg = 7'b0000110; // "E" 
            4'b1111: seg = 7'b0001110; // "F" 
        endcase
    end
    
endmodule
