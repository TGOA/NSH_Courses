`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 09:46:33 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 8)( 
    input logic [n - 1: 0] a, b,
    input logic op_select,
    output logic [n: 0]result
    );
    
    always_comb begin
        
        if (op_select == 0) begin
           result = a + b;
        end
        
        else begin 
        result = {1'b0, a} - b;
        
        end
        
    end
    
endmodule 
