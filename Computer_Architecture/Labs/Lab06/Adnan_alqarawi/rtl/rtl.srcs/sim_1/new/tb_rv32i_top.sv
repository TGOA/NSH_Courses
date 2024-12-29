`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2024 03:21:26 PM
// Design Name: 
// Module Name: tb_rv32i_top
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


`timescale 1ns/1ps

module tb_rv32i_top;

    logic clk;
    logic reset_n;

    // Instantiate your top-level CPU
    rv32i_top dut (
        .clk     (clk),
        .reset_n (reset_n)
    );

    // Clock generation: toggle clk every 5 ns (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset: hold low for 20 ns, then go high
    initial begin
        reset_n = 1'b0;
        #20;
        reset_n = 1'b1;
    end

    // Initialize instruction memory with program.hex (optional)
    // If your top module or inst_mem module does $readmemh internally,
    // you can omit this block or adapt it to match your design.
    initial begin
        // If dut.imem.memory is publicly visible, do:
        // $readmemh("machine.hex", dut.imem.memory);
        // Otherwise, if your inst_mem module has $readmemh inside it,
        // this step is not needed here.
        #0;
    end

    // Run simulation for a fixed time, then finish
    initial begin
        #10000; // e.g. run for 10,000 ns
        $finish;
    end

    // Optional waveform dump
    initial begin
        $dumpfile("tb_rv32i_top.vcd");
        $dumpvars(0, tb_rv32i_top);
    end

endmodule

