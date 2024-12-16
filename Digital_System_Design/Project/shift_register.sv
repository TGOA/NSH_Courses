`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 10:46:29 AM
// Design Name: 
// Module Name: shift_register
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


module shift_register (
    input clk, input reset_n,
    input load, output logic Data_out,
    input logic en_cun,
    input [7:0] dataIn
    
);
                
logic [7:0]Q;
always@(posedge clk or negedge reset_n) begin
    if(!reset_n)
        Q <= 8'b00000000;
    else if (en_cun) begin
    
        Q[0] <= Q[1];
        Q[1] <= Q[2];
        Q[2] <= Q[3];
        Q[3] <= Q[4];
        Q[4] <= Q[5];
        Q[5] <= Q[6];
        Q[6] <= Q[7];
        Q[7] <= 0;    
    
    end else if (load) begin
        Q <= dataIn;
    end
    
    Data_out<= Q[0];
end
endmodule