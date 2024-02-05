`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 10:25:10 PM
// Design Name: 
// Module Name: Mult_address
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


module Mult_adders_16bit_32bit(
    input [15:0] a,b,
    output [15:0] sum_ab,
    output cout_ab,
    
    input [31:0] x,y,
    output [31:0] sum_xy,
    output cout_xy
    );
    
    repple_carray_adder_nBit #(.n(16)) adder_16Bit
    (
    .x(a),
    .y(b),
    .cin(0),
    .s(sum_ab),
    .cout(cout_ab)
    );
    repple_carray_adder_nBit#(.n(32)) adder_32Bit
       (
       .x(x),
       .y(y),
       .cin(0),
       .s(sum_xy),
       .cout(cout_xy)
       );
endmodule
