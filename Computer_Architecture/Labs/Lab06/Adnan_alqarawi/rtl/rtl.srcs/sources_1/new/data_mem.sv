`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 09:01:39 PM
// Design Name: 
// Module Name: data_mem
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

module data_mem #(
    parameter int DEPTH = 1024,
    parameter int WIDTH = 32
)(
    input  logic            clk,
    input  logic            reset_n,
    input  logic            mem_write,
    input  logic [31:0]     addr,
    input  logic [WIDTH-1:0] wdata,
    output logic [WIDTH-1:0] rdata
);
    logic [WIDTH-1:0] mem [0:DEPTH-1];
    
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
             for (int i = 0; i < DEPTH; i++) begin
                 mem[i] <= '0;
             end
        end
        else begin
            if (mem_write) begin
                mem[addr[31:2]] <= wdata;
            end
        end
    end
    
    assign rdata = mem[addr[31:2]];
endmodule
