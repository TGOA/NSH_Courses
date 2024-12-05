`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 11:27:02 AM
// Design Name: 
// Module Name: SEV_SEG_TOP_lab5
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

module SEV_SEG_TOP_lab5(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,BTNC,   
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN,    
    input wire [15:0] SW     
);


logic reset_n;
logic clk;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

logic h1 ,h2, h3, h4;
logic p1, p2, p3, p4;
logic q1, q2, q3, q4;

  logic [3:0] pc_bus;
   logic [7:0] comand_bus;
    logic [7:0] ra_bus;
    logic [7:0] rb_bus;
    logic [7:0] r0_bus;
   logic [3:0] decoder_bus;
   logic [7:0] mux_bus;
   logic [7:0] alu_bus;
   logic carry_bus;
   logic dff_bus;
   logic flipflop_out;
   logic flipflop2_out;
   logic js;
   logic jump_bus;
   logic pc_bus_out;
   logic updown;
   logic [7:0] data_out;
   logic dff2_input;
   logic en_w;
   logic mux_select;
   logic [7:0] mux2_bus;
    logic [1:0]jc;
   logic overflow;
   logic write_en;
    

wire [6:0] Seg;
wire [3:0] digits[0:7];
wire [3:0] LED;
wire serial_out;
logic reset, se, serial_in;
logic [7:0]Q;

K2_agonyv2 dut (
        .reset(reset_n),  // Inout connected to wire
        .clk(BTNC),
        .ra_bus(ra_bus), .rb_bus(rb_bus), .r0_bus(r0_bus), .pc_bus(pc_bus)
 );


assign digits[0] = ra_bus[3:0];
assign digits[1] = ra_bus[7:4];
assign digits[2] = rb_bus[3:0];
assign digits[3] = rb_bus[7:4];
assign digits[4] = r0_bus[3:0];
assign digits[5] = r0_bus[7:4];
assign digits[6] = 4'b0000;
assign digits[7] = pc_bus;



sev_seg_controller ssc(
    .clk(clk),
    .resetn(reset_n),
    .digits(digits),
    .Seg(Seg),
    .AN(AN)
);


assign CA = Seg[0];
assign CB = Seg[1];
assign CC = Seg[2];
assign CD = Seg[3];
assign CE = Seg[4];
assign CF = Seg[5];
assign CG = Seg[6];
assign DP = 1'b1; // turn off the dot point on seven segs


endmodule : SEV_SEG_TOP_lab5