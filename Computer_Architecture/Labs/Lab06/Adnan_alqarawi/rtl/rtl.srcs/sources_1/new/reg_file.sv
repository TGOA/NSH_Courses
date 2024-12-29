`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 03:02:17 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input logic clk,
    input logic reset_n,
    input logic reg_write,
    input logic [4:0] raddr1,
    input logic [4:0] raddr2,
    input logic [4:0] waddr,
    input logic [31:0] wdata,
    output logic [31:0] rdata1,
    output logic [31:0] rdata2
    );
    
    logic [31:0] registers [31:0];
    
    always@(posedge clk, negedge reset_n) begin 
        if (~reset_n) begin
           for (int i = 0; i < 32; i++) begin
              registers[i] <= 32'h00000000;
            end
         end
           else  begin 
           if (reg_write) begin 
            registers[waddr] <= wdata;
           end    
       end
    end
    
    
    assign rdata1 = registers [raddr1];
    assign rdata2 = registers [raddr2];

endmodule
