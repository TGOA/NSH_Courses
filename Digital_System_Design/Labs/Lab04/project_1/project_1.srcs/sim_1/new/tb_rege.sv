`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 05:34:24 PM
// Design Name: 
// Module Name: tb_rege
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


module tb_rege;
  logic d1, d2, d3, d4, reset, en;
    logic q1, q2, q3, q4;
    rege dut (.d1(d1), .d2(d2), .d3(d3), .d4(d4), .reset(reset), .clk(en), .q1(q1), .q2(q2), .q3(q3), .q4(q4));
    
    
    initial begin
    
    reset = 1; 
    #5
    reset = 0;
    
    #5
    reset = 1;
    
    for (int i = 0; i < 200; i++) begin
        {d1, d2, d3, d4, en} = i;
        #10;
    end
    $finish;
    end
endmodule
