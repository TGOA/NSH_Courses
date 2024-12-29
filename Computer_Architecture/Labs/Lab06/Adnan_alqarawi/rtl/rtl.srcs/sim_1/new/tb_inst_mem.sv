`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2024 03:29:26 PM
// Design Name: 
// Module Name: tb_inst_mem
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

module tb_inst_mem;

    logic [31:0] address;
    logic [31:0] instruction;

    // Instantiate the DUT (Device Under Test)
    inst_mem dut (
        .address(address),
        .instruction(instruction)
    );

    initial begin
        // Optional waveform dump
        $dumpfile("tb_inst_mem.vcd");
        $dumpvars(0, tb_inst_mem);
    end

    initial begin
        // Try multiple addresses and display the instruction output
        address = 32'd0;
        #10;
        $display("Time=%t | address=%d => instruction=%h", $time, address, instruction);

        address = 32'd4;
        #10;
        $display("Time=%t | address=%d => instruction=%h", $time, address, instruction);

        address = 32'd8;
        #10;
        $display("Time=%t | address=%d => instruction=%h", $time, address, instruction);

        address = 32'd12;
        #10;
        $display("Time=%t | address=%d => instruction=%h", $time, address, instruction);

        // Optionally continue testing more addresses here
        // address = 32'd16; etc.

        #20;
        $finish;
    end

endmodule
