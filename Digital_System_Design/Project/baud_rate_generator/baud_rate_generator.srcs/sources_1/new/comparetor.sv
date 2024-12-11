`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 12:07:55 PM
// Design Name: 
// Module Name: comparetor
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

module comparetor #(parameter n = 8)(
    input logic [n-1: 0] x,y,
    output logic cnt_end
);


    always@(*) begin 
        if (x == y) 
            cnt_end = 1;
            
        else 
            cnt_end = 0; 
    
    end 

endmodule