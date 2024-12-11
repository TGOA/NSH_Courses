`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 04:29:30 PM
// Design Name: 
// Module Name: tb_baud_rate_generator
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


module tb_baud_rate_generator;

    // Parameters for baud rate generator
    parameter DIV_FACTOR_TX = 10417; // For 9600 Hz
    parameter DIV_FACTOR_RX = 651;   // For 153,600 Hz

    // Testbench signals
    logic clk;
    logic reset_n;
    logic baud_clk_tx;
    logic baud_clk_rx;

    // Instantiate the DUT (Device Under Test)
    baud_rate_generator #(
        .DIV_FACTOR_TX(DIV_FACTOR_TX),
        .DIV_FACTOR_RX(DIV_FACTOR_RX)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),
        .baud_clk_tx(baud_clk_tx),
        .baud_clk_rx(baud_clk_rx)
    );

    // Clock generation: 100 MHz clock (10 ns period)
    always #5 clk = ~clk;

    // Testbench procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;

        // Apply reset
        #20 reset_n = 1;

        // Run the simulation for a specific time
        #2000000 $stop; // Stop simulation after 2 ms
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | clk: %b | reset_n: %b | baud_clk_tx: %b | baud_clk_rx: %b",
                 $time, clk, reset_n, baud_clk_tx, baud_clk_rx);
    end

endmodule

