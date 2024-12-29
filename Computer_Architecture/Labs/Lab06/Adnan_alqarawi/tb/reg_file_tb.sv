`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 04:22:45 PM
// Design Name: 
// Module Name: reg_file_tb
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

module reg_file_tb;

logic clk;
logic reset_n;
logic reg_write;
logic [4:0] raddr1;
logic [4:0] raddr2;
logic [4:0] waddr;
logic [31:0] wdata;
logic [31:0] rdata1;
logic [31:0] rdata2;

reg_file dut (
    .clk(clk),
    .reset_n(reset_n),
    .reg_write(reg_write),
    .raddr1(raddr1),
    .raddr2(raddr2),
    .waddr(waddr),
    .wdata(wdata),
    .rdata1(rdata1),
    .rdata2(rdata2)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset_n = 0;
    reg_write = 0;
    raddr1 = 5'd0;
    raddr2 = 5'd0;
    waddr = 5'd0;
    wdata = 32'h00000000;
    #15;
    reset_n = 1;
    #10;
    waddr = 5'd1;
    wdata = 32'hAAAAAAAA;
    reg_write = 1;
    #10;
    reg_write = 0;
    raddr1 = 5'd1;
    #10;
    $display("rdata1=%h", rdata1);
    #10;
    waddr = 5'd2;
    wdata = 32'h55555555;
    reg_write = 1;
    #10;
    reg_write = 0;
    raddr2 = 5'd2;
    #10;
    $display("rdata2=%h", rdata2);
    #10;
    reset_n = 0;
    #10;
    reset_n = 1;
    #10;
    raddr1 = 5'd1;
    raddr2 = 5'd2;
    #10;
    $display("rdata1=%h, rdata2=%h", rdata1, rdata2);
    #20;
    $finish;
end

initial begin
    $dumpfile("tb_reg_file.vcd");
    $dumpvars(0, tb_reg_file);
end

endmodule

