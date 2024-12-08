`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 09:38:00 PM
// Design Name: 
// Module Name: downcounter
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



module downcounter #(parameter n = 8 )(
    input logic en_x, clk, reset,
    output logic [n-1: 0] counter
);
    
    
    always @(posedge clk, negedge reset) begin 
        if (~reset) begin
            counter <= 0;
        end
        else if(en_x==1)  begin
            counter <= counter - 1;
       end

    end
    
    
endmodule