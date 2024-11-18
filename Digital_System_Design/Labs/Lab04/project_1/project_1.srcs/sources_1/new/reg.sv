`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 05:26:10 PM
// Design Name: 
// Module Name: reg
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


module rege(input d1, input d2, input d3, input d4, input reset, input clk , output q1, output q2, output q3, output q4);

flipflop df1(
.d(d1),
.q(q1),
.reset(reset),
.en(clk)
);
flipflop df2(
.d(d2),
.q(q2),
.reset(reset),
.en(clk)
);
flipflop df3(
.d(d3),
.q(q3),
.reset(reset),
.en(clk)
);
flipflop df4(
.d(d4),
.q(q4),
.reset(reset),
.en(clk)
);
endmodule
