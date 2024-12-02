`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:20:58 PM
// Design Name: 
// Module Name: tb_task1_1
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
module tb_counter_8bits;

  // Declare testbench signals
  logic clk;
  logic reset;
  logic [7:0] count;
  logic overflow;
  logic  q;

  counter_8bits uut (
    .clk(clk),
    .reset(reset),
    .count(count),
    .overflow(overflow),
    .q(q)
  );

  initial clk = 0;
  always #5 clk = ~clk; 
  initial begin


    reset = 0;
    count = 8'b0;

    #10 reset = 1;
    count = 8'b11111111;
    #12
    count = 8'b00000000;

    


  end

endmodule


