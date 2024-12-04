`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 05:01:28 PM
// Design Name: 
// Module Name: counter1
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


module counter1 #(parameter n = 8 )(
    input logic en_x, clk, reset,
    output logic [n-1: 0] counter
);
    
    
    always @(posedge clk, negedge reset) begin 
        if (~reset)
            counter <= 0;
        else
            counter <= counter +1;
    
    end
    
    
endmodule
