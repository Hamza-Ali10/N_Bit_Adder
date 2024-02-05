`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 01:41:10 AM
// Design Name: hamza ali
// Module Name: Adder_subtracter_overflow
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


module Adder_subtracter_overflow #(parameter n=8)(
       input [n-1:0] x,y,
       input cin,
       output [n-1:0] s,
       output cout,
       output overflow
   );
   //Declace diffenent signals
   wire [n-1:0] xored_y;
   
   //generate several XOR gates 
   generate
   genvar i;
        for(i=0 ; i<n ;i=i+1)
        begin: bit
             assign xored_y[i] = y[i] ^ cin;
           end
   endgenerate
   
   //Instantiate an n adder
   repple_carray_adder_nBit #(.n(n)) A0(
       .x(x),
       .y(xored_y),
       .cin(cin),
       .s(s),
       .cout(cout)
       );
    //last dig1=1, dig2=1 ,sum=0 or  last dig1=0, dig2=0 ,sum=1 this will overflow
    assign overflow = (x[n-1] & xored_y[n-1] & ~s[n-1])|(~x[n-1] & ~xored_y[n-1] & s[n-1]);
    
endmodule
