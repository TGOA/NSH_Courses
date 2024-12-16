`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 12:04:23 PM
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module counter #(parameter n = 8 )(
    input logic en_cnt, clk, reset,
    output logic [n-1: 0] counter
);
    
    
    always @(posedge clk, negedge reset) begin 
        if (~reset) begin
            counter <= 0;
        end
        else if(en_cnt == 1)  begin
            counter <= counter +1;
       end

    end
    
    
endmodule


