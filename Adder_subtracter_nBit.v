`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 12:51:52 AM
// Design Name: 
// Module Name: Adder_subtracter_nBit
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


module Adder_subtracter_nBit #(parameter n=8)(
 input [n-1:0] x,y,
   input cin,
   output [n-1:0] s,
   output cout
   );
   wire [n-1:0] xored_y;
   generate
   genvar i;
        for(i=0 ; i<n ;i=i+1)
        begin: bit
             assign xored_y[i] = y[i] ^ cin;
           end
   endgenerate
   repple_carray_adder_nBit #(.n(n)) A0(
       .x(x),
       .y(xored_y),
       .cin(cin),
       .s(s),
       .cout(cout)
       );
    
endmodule
