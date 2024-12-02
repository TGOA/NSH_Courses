`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 01:54:50 AM
// Design Name: 
// Module Name: adder_subtractor_4bit
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


module adder_subtractor_4bit( 
    input [3:0] x, y,
    input m,
    output [3:0] s,
    output c_out
    );
    logic [3:0] ya;
    assign ya[0] = m ^ y[0];
    assign ya[1] = m ^ y[1];
    assign ya[2] = m ^ y[2];
    assign ya[3] = m ^ y[3];
    rca_4bit A0 (
    .x(x),
    .y(ya),
    .c_in(m),
    .c_out(c_out),
    .s(s)
    
    );
    
endmodule
