`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 09:32:20 PM
// Design Name: 
// Module Name: N_Bit_Adder
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


module  repple_carray_adder_nBit#(parameter n=8)(
    input [n-1:0] x,y,
    input cin,
    output [n-1:0]sum,
    output cout
    );
    
    wire [n:0]c;
    assign c[0]=cin;
    assign c[n]=cout;
    
      generate
        genvar i;
            for(i = 0; i < n; i =i +1)
            begin: stage
            fulladder_using_halfadder FA(
                .x(x[i]),
                .y(y[i]),
                .cin(c[i]),
                .s(sum[i]),
                .cout(c[i+1])
                );
            
            end
    endgenerate
    
endmodule
