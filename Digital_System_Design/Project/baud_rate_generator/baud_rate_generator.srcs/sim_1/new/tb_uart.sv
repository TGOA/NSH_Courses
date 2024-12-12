`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 08:54:49 PM
// Design Name: 
// Module Name: tb_uart
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

`timescale 1ns / 1ps

module tb_uart;

    // Testbench signals
    logic valid;
    logic clk;
    logic reset;
    logic parity;
    logic parity_type;
    logic [7:0] data_in;
    logic Data_out;
    logic [7:0] data;
    
    // Baud rate clocks


    // Instantiate the uart module
    uart uut (
        .valid(valid),
        .clk(clk),
        .reset(reset),
        .parity(parity),
        .data_in(data_in),
        .Data_out(Data_out),
        .data(data)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock
    end
    
    // Stimulus
    initial begin
        // Initialize signals
        reset = 1;
        valid = 0;
        parity = 0;
        parity_type = 0;
        data_in = 8'h00;
        
        // Apply reset
        #10 reset = 0;  // Release reset after 10ns
        #10 reset = 1;
        
        // Test Case 1: Send data
        #20;
        valid = 1;
        data_in = 8'hA5; // Sending test data 0xA5
        parity = 1;       // Parity enabled
        parity_type = 0;  // Even parity
        
        #10 valid = 0;    // Deassert valid
        #100;             // Wait for the transmission and reception

        // Test Case 2: Check receiver output
        // Wait for some cycles to observe the output
        #20;
        if (data == 8'hA5) begin
            $display("Test Passed: Data received correctly: %h", data);
        end else begin
            $display("Test Failed: Incorrect data received: %h", data);
        end
        
        // Test Case 3: Test reset behavior
        #20;
        reset = 0;
        #10 reset = 1;
        #10;
        valid = 1;
        data_in = 8'hFF;
        #10 valid = 0;
        #100; // Wait for transmission

        // End of Test
        $finish;
    end
    
endmodule
