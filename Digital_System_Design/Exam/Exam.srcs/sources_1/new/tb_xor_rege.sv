`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:08:07 PM
// Design Name: 
// Module Name: tb_xor_rege
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

module tb_xor_rege;
    logic clk;
    logic  [7:0]count;       
    logic overflow;          
    logic reset;             
    logic  [7:0]Q;
    logic XORC;           

    xor_rege dut (
        .clk(clk),
        .reset(reset),
        .count(count),
        .Q(Q),
        .XORC(XORC)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        count = 8'b00000000;

        #10 reset = 1; 

        for (int i = 0; i < 256; i++) begin
            count= i;          
            #10;                
        end

        $finish;
    end
endmodule
