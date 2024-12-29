`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 10:56:40 PM
// Design Name: 
// Module Name: inst_mem
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


module inst_mem(
    input  logic [31:0] address,
    output logic [31:0] instruction
);
    logic [31:0] memory [0:255];

    initial begin
        $readmemh("/home/it/machine.hex", memory);
    end

    assign instruction = memory[address[31:2]];

endmodule


