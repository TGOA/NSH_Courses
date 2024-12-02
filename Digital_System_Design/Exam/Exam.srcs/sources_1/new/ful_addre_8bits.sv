`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:41:09 PM
// Design Name: 
// Module Name: ful_addre_8bits
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


module ful_addre_8bits(

    input logic [7:0] A,B,
    input logic cin,
    output logic  cout, cout2,
    output logic [3:0] sum1, sum2,
    output logic [7:0] result   
    );
    
    full_addre_4bit adder1 (
    .A(A[3:0]),
    .B(B[3:0]),
    .cin(cin),
    .cout(cout),
    .sum(sum1)
    );
    

     full_addre_4bit adder2 (
    .A(A[7:4]),
    .B(B[7:4]),
    .cin(cout),
    .cout(cout2),
    .sum(sum2)
    );
    
    assign result = {sum2,sum1};
    
endmodule
