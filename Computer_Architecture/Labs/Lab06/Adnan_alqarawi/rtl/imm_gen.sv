`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 09:00:30 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
    input logic [31:0] inst,
    output logic [31:0]imm
    );
    
    logic [6:0] opcode; 
    
    always_comb begin 
        opcode = inst [6:0];
        imm = 32'd0;
        
        case(opcode)
            
            7'b0000011,
            7'b0010011: begin
                imm = { {20{inst[31]}}, inst[31:20] };
            end
            7'b1100011: begin
                imm = { {19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0 };
            end
            7'b0100011: begin 
                imm = { {20{inst[31]}}, inst[31:25], inst[11:7]};  
            end 
            default: begin
                imm = 32'd0;
          
            end 
        endcase
    
    end 
    
    
endmodule
