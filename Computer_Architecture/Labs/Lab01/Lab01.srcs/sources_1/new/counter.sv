`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 02:54:32 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter n = 8)(
    input logic clk, reset,
    output logic [n-1: 0] count
    
    );
    
    always @(posedge clk or negedge reset) begin
        if (~reset)
            count <= 0; 
        else if (count == 3)
            count <= 0; 
        else
            count <= count + 1; 
    end
endmodule
