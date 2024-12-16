`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:50:46 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 8)(
    input logic [n-1 : 0] a, b,
    input logic [1:0] opcode,
    output logic [n - 1:0]out
    
    );
    
    always_comb begin 
       case(opcode) 
        2'b00: out = a + b;
        2'b01: out = a - b ;
        2'b10: out = a & b;
        2'b11: out = a | b;
        default: out = a + b;
       
       endcase
        
    
    
    
    end 
    
endmodule
