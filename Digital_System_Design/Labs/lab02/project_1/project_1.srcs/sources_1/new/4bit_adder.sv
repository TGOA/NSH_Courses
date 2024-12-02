`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 01:39:37 AM
// Design Name: 
// Module Name: 4bit_adder
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


module rca_4bit(
    input [3:0] x, y,
    input c_in,
    output [3:0] s,
    output c_out
);

logic c1, c2, c3;
full_adder FA1 (
    .a(x[0]),
    .b(y[0]),
    .c_in(c_in),
    .s(s[0]),
    .c_out(c1)
);

full_adder FA2 (
    .a(x[1]),
    .b(y[1]),
    .c_in(c1),
    .s(s[1]),
    .c_out(c2)
);
full_adder FA3 (
    .a(x[2]),
    .b(y[2]),
    .c_in(c2),
    .s(s[2]),
    .c_out(c3)
);
full_adder FA4 (
    .a(x[3]),
    .b(y[3]),
    .c_in(c3),
    .s(s[3]),
    .c_out(c_out)
);
endmodule
