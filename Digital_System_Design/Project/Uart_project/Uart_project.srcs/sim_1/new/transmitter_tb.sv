`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024
// Design Name: 
// Module Name: transmitter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench for the transmitter module
// 
// Dependencies: transmitter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module transmitter_tb;

    // Testbench signals
    logic valid;
    logic clk;
    logic reset;
    logic parity;
    logic [7:0] data_in;
    logic Data_out;

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100MHz clock

    // DUT instantiation
    transmitter dut (
        .valid(valid),
        .clk(clk),
        .reset(reset),
        .parity(parity),
        .data_in(data_in),
        .Data_out(Data_out)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        valid = 0;
        reset = 0;
        parity = 0;
        data_in = 8'h00;

        // Reset pulse
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;

        // Test case 1: Transmit data 0xA5 with even parity
        parity = 1;
        data_in = 8'hA5;
        valid = 1;
        #20;
        valid = 0;

        // Wait for transmission to complete
        #100;

        // Test case 2: Transmit data 0x3C with odd parity
        parity = 0;
        data_in = 8'h3C;
        valid = 1;
        #20;
        valid = 0;

        // Wait for transmission to complete
        #100;

        // Test case 3: Reset during operation
        parity = 1;
        data_in = 8'hF0;
        valid = 1;
        #10 reset = 0; // Assert reset mid-transmission
        #10 reset = 1;
        valid = 0;

        // Wait for stabilization
        #50;

        // End simulation
        $stop;
    end

endmodule
