`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:57:59 PM
// Design Name: 
// Module Name: xor_rege
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


module xor_rege (
    input clk,                    
    input reset,                  
    input logic [7:0]count,             
    output logic [7:0]Q,
    output logic XORC          
);
 
    always @(posedge clk or negedge reset) begin
        if (!reset) 
            Q <= 8'd0;            
        else
            Q <= count;           
    end
    
    assign XORC = ^Q;
endmodule
