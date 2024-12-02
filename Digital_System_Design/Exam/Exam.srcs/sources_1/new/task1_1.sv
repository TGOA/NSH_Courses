`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 01:08:14 PM
// Design Name: 
// Module Name: task1_1
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


//module counter_8bits (
//  input logic clk,          
//  input logic reset,        
//  input logic [7:0]count, 
//  output logic overflow,
//  output logic q     
//);

//  always_ff @(posedge clk, negedge reset) begin
//    if (~reset) begin 
//       q <= 1'b0;      
//      overflow <= 1'b0;     
//    end else begin
//      if (count == 8'hFF)   
//        overflow <= 1'b1;   
//      else
//        overflow <= 1'b0;
//        q <= count;
//    end
//  end

//endmodule

module counter_8bits (
  input logic clk,          
  input logic reset,        
  input logic [7:0] count, 
  output logic overflow,
  output logic  q     
);

  always_ff @(posedge clk or negedge reset) begin
    if (~reset) begin 
      q <= 1'b0;      
    end else begin
      q <= count[7];
    end
  end

assign overflow = ~count[7] & q;
endmodule

 


