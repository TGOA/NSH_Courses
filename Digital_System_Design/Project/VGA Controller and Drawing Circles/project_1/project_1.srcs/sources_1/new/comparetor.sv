`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 05:00:09 PM
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
    output logic signal
);


    always@(*) begin 
        if (x == y) 
            signal = 1;
            
        else 
            signal = 0; 
    
    end 

endmodule
