`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 10:53:01 PM
// Design Name: 
// Module Name: program_counter_tb
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

module program_counter_tb;

    parameter int n = 32;

    logic clk;
    logic reset_n;
    logic [n-1:0] next_pc;
    logic [n-1:0] current_pc;

    program_counter #(.n(n)) dut (
        .clk(clk),
        .reset_n(reset_n),
        .data_in(next_pc),
        .data_o(current_pc)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset_n = 1'b0;
        next_pc = '0;

        #12;
        reset_n = 1'b1;
        @(posedge clk);

        next_pc = 32'h00000004;
        @(posedge clk);
        $display("Time=%t : next_pc=0x%h, current_pc=0x%h", $time, next_pc, current_pc);

        next_pc = 32'h00000008;
        @(posedge clk);
        $display("Time=%t : next_pc=0x%h, current_pc=0x%h", $time, next_pc, current_pc);

        next_pc = 32'h00000010;
        @(posedge clk);
        $display("Time=%t : next_pc=0x%h, current_pc=0x%h", $time, next_pc, current_pc);

        reset_n = 1'b0;
        @(posedge clk);
        $display("Time=%t : Reset asserted. current_pc=0x%h", $time, current_pc);

        reset_n = 1'b1;
        @(posedge clk);

        next_pc = 32'hABCDEF00;
        @(posedge clk);
        $display("Time=%t : next_pc=0x%h, current_pc=0x%h", $time, next_pc, current_pc);

        #10;
        $finish;
    end

    initial begin
        $dumpfile("program_counter_tb.vcd");
        $dumpvars(0, tb_program_counter);
    end

endmodule

