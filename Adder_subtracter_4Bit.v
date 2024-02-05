`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 12:28:59 AM
// Design Name: 
// Module Name: Adder_subtracter_4Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder_subtracter_4Bit(

    input [3:0] x,y,
    input cin,
    output [3:0] s,
    output cout
    );
    wire [3:0] xored_y;
    
    assign xored_y[0] = y[0] ^ cin;
    assign xored_y[1] = y[1] ^ cin;
    assign xored_y[2] = y[2] ^ cin;
    assign xored_y[3] = y[3] ^ cin;
    
    repple_carray_adder_4Bit A0(
        .x(x),
        .y(xored_y),
        .cin(cin),
        .s(s),
        .cout(cout)
        );
    
    
    
endmodule
