`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:58:33 PM
// Design Name: 
// Module Name: register
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
module register (
    input logic clk,          
    input logic rst,          
    input logic en,           
    input logic [7:0] d,      
    output logic [7:0] q      
);

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            q <= 8'b0;        
        end else if (en) begin
            q <= d;           
        end
    end

endmodule



