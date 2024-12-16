`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 03:02:57 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory #(parameter n = 8)(
     input logic [$clog2(n) - 1: 0] pc,
     output logic [7:0] instruction
    );
    
    logic [7:0] inst [n - 1 : 0];
    initial begin 
    $readmemb("/home/it/eda_training/Computer_Architecture/Labs/fib_im.mem", inst); 
    end
    assign instruction = inst[pc];
endmodule
