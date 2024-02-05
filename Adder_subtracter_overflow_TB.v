`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 04:12:36 PM
// Design Name: Hamza Ali
// Module Name: Adder_subtracter_overflow_TB
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


module Adder_subtracter_overflow_TB(


    );
    // 1) Declare local wire and reg identifiere 
    // outout call it wire 
    // input  call it reg
    parameter n=8;
   reg [n-1:0] x,y;
   reg cin;
   wire [n-1:0] s;
   wire cout;
   wire overflow;
    
    // 2) Instantiate the module under test 
    
    // you put the same name in this file
    Adder_subtracter_overflow #(.n(n)) unt
    (
    .x(x),
    .y(y),
    .cin(cin),
    .s(s),
    .cout(cout),
    .overflow(overflow)
    );
    
    // 3) Specify a stopwatch to stop the simulation
    
    initial 
    begin
            #40 $finish;
    
    end
    
    // 4) Generate stimuli ,using initial and always 
    
    // we can use always or initial : diffenrnt ?
    // initial will only run once and that is it in combinational circuits
    // and in sequential circuits we use always  
     initial 
     begin
             cin = 1'b0;
             x   = 4'd5;
             y   = 4'd6;
             
             #10
             cin = 1'b1;   // will subtractor 
             
             #10
             x   = 4'd6;
             y   = -4'd3;
             
             #10
             cin = 1'b0;
             x   = 4'd4;
             y   = -4'd5;
             
             #10;
     end
    
    //5)Dispaly the output response (text or graphices ) or both
    
    initial 
    begin
            $monitor("time = %3d: x=%d \t y=%d \t cin=%1b \t result=%3d \t cout=%1b \t overflow=%1b",
            $time, x, y, cin, s, cout, overflow);
    end 
    
endmodule
