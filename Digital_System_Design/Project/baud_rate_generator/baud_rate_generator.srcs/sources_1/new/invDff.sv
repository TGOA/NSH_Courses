`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 12:27:07 PM
// Design Name: 
// Module Name: filpflop
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


module invDff (
  input logic clk,
  input logic reset,
  input logic en,
  output logic q
);

  always_ff @(posedge clk or  negedge reset) begin
    if (!reset)
      q <= 0; // Reset the flip-flop
    else if (en)
      q <= ~q; // Store the value of D on the rising edge of the clock

  end

endmodule
