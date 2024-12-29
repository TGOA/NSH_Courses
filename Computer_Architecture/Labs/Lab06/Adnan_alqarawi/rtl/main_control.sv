`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2024 01:01:10 PM
// Design Name: 
// Module Name: main_control
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



module main_control(
    input  logic [6:0] opcode,
    output logic       reg_write,
    output logic       mem_write,
    output logic       mem_to_reg,
    output logic [1:0] alu_op,
    output logic       alu_src,
    output logic       branch
);

    always_comb begin
        reg_write  = 0;
        mem_write  = 0;
        mem_to_reg = 0;
        alu_op     = 2'b00;
        alu_src    = 0;
        branch     = 0;

        case (opcode)
           
            7'b0110011: begin
                reg_write  = 1;
                mem_write  = 0;
                mem_to_reg = 0;
                alu_op     = 2'b10;  
                alu_src    = 0;
                branch     = 0;
            end

           
            7'b0010011: begin
                reg_write  = 1;
                mem_write  = 0;
                mem_to_reg = 0;
                alu_op     = 2'b11;  
                alu_src    = 1;
                branch     = 0;
            end

           
            7'b0000011: begin
                reg_write  = 1;
                mem_write  = 0;
                mem_to_reg = 1;
                alu_op     = 2'b00;
                alu_src    = 1;
                branch     = 0;
            end

           
            7'b0100011: begin
                reg_write  = 0;
                mem_write  = 1;
                mem_to_reg = 1'bx; 
                alu_op     = 2'b00;
                alu_src    = 1;
                branch     = 0;
            end
            
            7'b1100011: begin
                reg_write  = 0;
                mem_write  = 0;
                mem_to_reg = 1'bx; 
                alu_op     = 2'b01;
                alu_src    = 0;
                branch     = 1;
            end

            // Default (unrecognized opcode)
            default: begin
                reg_write  = 0;
                mem_write  = 0;
                mem_to_reg = 0;
                alu_op     = 2'b00;
                alu_src    = 0;
                branch     = 0;
            end
        endcase
    end

endmodule
