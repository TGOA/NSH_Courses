`timescale 1ns / 1ps

module tb_top_module;
    // Declare testbench signals
    logic clk;
    logic reset;
    logic alu_result;

    // Instantiate the top module
    top_module uut (
        .clk(clk),
        .reset(reset),
        .alu_result(alu_result)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Apply reset
        reset = 0;
        #10;
        reset = 1;

        // Allow the module to operate for some cycles
        repeat (10) @(posedge clk);

        // Display ALU result
        $display("ALU Result: %b", alu_result);

        // Add additional test cases or scenarios as needed
        #50;
        
        // Finish simulation
        $finish;
    end

    // Monitor signals for debugging
    initial begin
        $monitor("Time: %0t | Reset: %b | ALU Result: %b", $time, reset, alu_result);
    end
endmodule
