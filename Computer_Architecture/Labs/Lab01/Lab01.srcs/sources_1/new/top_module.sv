`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 03:20:24 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input logic clk, reset,
    output logic [15:0] alu_result
    );
    logic [1:0]pc;
    logic [7:0] instruction;
    logic [15:0] op1;
    logic [15:0] op2;
  Instruction_memory  #(4) imm(
    .pc(pc),
    .instruction(instruction)
  );
  
  counter #(2) pc_counter(
    .clk(clk),
    .reset(reset),
    .count(pc)
  );
  
  ALU #(16) alu(
    .a(op1),
    .b(op2),
    .opcode(instruction[1:0]),
    .out(alu_result)
  );
  
  Register_file #(16) register_file (
    .clk(clk),
    .rs1(instruction[3:2]),
    .rs2(instruction[5:4]),
    .alu_result(alu_result),
    .rd(instruction[7:6]),
    .op1(op1),
    .op2(op2)
    
  );
  
  
  
  
endmodule
