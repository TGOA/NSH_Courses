`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:22:05 PM
// Design Name: 
// Module Name: full_addre_4bit
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


module full_addre_4bit(
    input logic [3:0] A,B,
    input logic cin,
    output logic cout,
    output logic [3:0] sum
    );    
    logic [4:0 ] temp;

    assign temp = A + B + cin;
    assign sum = temp [3:0];
    assign cout = temp[4];
    
    
    
    
endmodule
