`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 04:37:18 PM
// Design Name: 
// Module Name: tb_flipflop
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


module tb_flipflop;
    logic d, reset, en;
    logic q, p;
    filpflop dut (.d(d), .reset(reset), .en(en), .q(q), .p(p));
    
    
    initial begin
    
    reset = 1; 
    #5
    reset = 0;
    
    #5
    reset = 1;
    
    for (int i = 0; i < 200; i++) begin
        {d, en} = i;
        #10;
    end
    $finish;
    end
endmodule
