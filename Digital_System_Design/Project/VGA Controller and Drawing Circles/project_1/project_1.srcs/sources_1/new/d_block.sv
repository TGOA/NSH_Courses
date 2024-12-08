`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 10:31:53 PM
// Design Name: 
// Module Name: d_block
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


module d_block(
    input logic [7:0] d,
    input logic [7:0] x,
    input logic [7:0] y,
    input d_select,
    output logic [7:0] d_out

    );
    
    always_comb begin 
        d_out = d;
        
        if (d_select == 0) begin
            d_out = d + (4 * x) + 6;
          end else begin 
            d_out = d + 4 * (x - y) + 10;
          
          end
    
    
    end
    
endmodule
