`timescale 1ns/1ps

module uart_tb;

    // Testbench Signals
    logic clk;
    logic reset_n;
    logic valid;
    logic parity;
    logic [7:0] data_in;
    wire [7:0] data;
    wire Data_out;

    // Instantiate DUT
    uart uut (
        .valid(valid),
        .clk(clk),
        .reset_n(reset_n),
        .parity(parity),
        .data_in(data_in),
        .Data_out(Data_out),
        .data(data)
    );

    // Clock Generation: 10ns period => 100 MHz clock
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk; 
    end

    // Test Procedure
    initial begin
        // Initialize signals
        reset_n = 1'b0;
        valid   = 1'b0;
        parity  = 1'b0;
        data_in = 8'h00;

        // Apply reset
        #100;
        reset_n = 1'b1;
        
        // Wait a bit for system to stabilize
        #200;

        // Send first byte of data
        data_in = 8'hA5; // example data: 0xA5
        valid   = 1'b1;
        #20;
        valid   = 1'b0;

        // Wait enough time for this byte to fully transmit and be received
        // The waiting time depends on your baud rate. Ensure this delay is 
        // long enough for the UART to shift out all bits and the receiver 
        // to capture them.
        #2000; 

        // Check what the receiver got
        $display("Received data after first transmission: %h", data);

        // Send another byte with parity bit set
        parity  = 1'b1;
        data_in = 8'h3C; 
        valid   = 1'b1;
        #20;
        valid   = 1'b0;

        // Again, wait for reception
        #2000;

        $display("Received data after second transmission: %h", data);

        // Finish simulation
        #1000;
        $finish;
    end

endmodule
