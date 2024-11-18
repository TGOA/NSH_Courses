`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 02:38:43 PM
// Design Name: 
// Module Name: Dlatch
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


module Dlatch( input d, input en, input reset, output reg q, output reg p);
    logic w1, w2, w3, w4;
    
    nand(w1, d, en);
    nand(w2, ~d, en);
    or(w3, ~reset, w1);
    and(w4, w2, reset);
    nand(q, w3, p);
    nand (p, w4, q);
    
endmodule
