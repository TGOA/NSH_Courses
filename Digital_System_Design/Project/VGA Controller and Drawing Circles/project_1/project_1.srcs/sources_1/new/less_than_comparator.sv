`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 10:27:56 PM
// Design Name: 
// Module Name: less_than_comparator
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



module less_than_comparator #(parameter n = 8)(
    input logic [n-1: 0] x,y,
    output logic less_than_signal
);


    always@(*) begin 
        if (x <= y) 
            less_than_signal = 1;
            
        else 
            less_than_signal = 0; 
    
    end 

endmodule