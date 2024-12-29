`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 04:39:24 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input logic [31:0] op1,
    input logic [31:0] op2,
    input logic [3:0] alu_ctr,
    output logic zero,
    output logic [31 :0 ] alu_resul
    );
    
    always_comb begin 
        case (alu_ctr) 
            4'b0000: alu_resul = op1 + op2;
            4'b1000: alu_resul = op1 - op2;
            4'b0001: alu_resul = op1 << op2[4:0];
            4'b0101: alu_resul = op1 >> op2[4:0];
            4'b1101: alu_resul = $signed(op1) >>> op2[4:0];
            4'b0111: alu_resul = op1 & op2;
            4'b0110: alu_resul = op1 | op2;
            4'b0100: alu_resul = op1 ^ op2;
            4'b0010: alu_resul = ($signed(op1) < $signed(op2)) ? 32'h1 : 32'h0;
            4'b0011: alu_resul = (op1 < op2) ? 32'h1 : 32'h0;
            default: alu_resul = 32'h0;
        endcase
        
        
    end
    
    assign zero = ~(|alu_resul);
    
    
    
endmodule
