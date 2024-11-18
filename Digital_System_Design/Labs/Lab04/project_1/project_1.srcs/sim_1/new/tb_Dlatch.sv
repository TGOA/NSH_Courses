`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 02:59:56 PM
// Design Name: 
// Module Name: tb_Dlatch
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


module tb_Dlatch;
    logic d, reset, en;
    logic q, p;
    Dlatch dut (.d(d), .reset(reset), .en(en), .q(q), .p(p));
    initial begin
    for (int i = 0; i < 200; i++) begin
    {d, reset, en} = i;
    #10;
    end
    $finish;
    end
endmodule
