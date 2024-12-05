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

module FPGA(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,BTNC, BTND,   
//    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output logic VGA_VS,VGA_HS,
    output logic  [3:0] VGA_R,VGA_G, VGA_B
//    output wire [7:0] AN,    
//    input wire [15:0] SW     
);


logic reset_n;
logic clk;
logic plot;
//logic btnc, btnd;
logic [7:0]x;
logic [6:0]y;
//logic VGA_VS,VGA_HS;
logic VGA_R,VGA_G, VGA_B;
logic [2:0] rgb;

assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

(* dont_touch ="true" *)top_module2 cir (
     
     .clk(clk),
     .reset(reset_n),
     .btnc(BTNC),
     .btnd(BTND),
     .plot(plot),
     .counterxbus(x),
     .counteryby(y),
     .color(rgb)

);
    

(* dont_touch ="true" *) vga_core moni(.clk(clk), .resetn(reset_n), .x(x), .y(y), .plot(plot), .color(rgb),
.VGA_R(VGA_R), .VGA_G(VGA_G), .VGA_B(VGA_B), .VGA_VS(VGA_VS), .VGA_HS(VGA_HS));


ila_0 your_instance_name (
	.clk(clk), // input wire clk


	.probe0(x), // input wire [7:0]  probe0  
	.probe1(y) // input wire [6:0]  probe1
);
wire [6:0] Seg;
wire [3:0] digits[0:7];
wire [3:0] LED;
wire serial_out;
//logic reset, se, serial_in;



//assign digits[0] = 
//assign digits[1] = 
//assign digits[2] = 
//assign digits[3] = 
//assign digits[4] = 
//assign digits[5] = 
//assign digits[6] = 4'b0000;
//assign digits[7] = ;



//sev_seg_controller ssc(
//    .clk(clk),
//    .resetn(reset_n),
//    .digits(digits),
//    .Seg(Seg),
//    .AN(AN)
//);


//assign CA = Seg[0];
//assign CB = Seg[1];
//assign CC = Seg[2];
//assign CD = Seg[3];
//assign CE = Seg[4];
//assign CF = Seg[5];
//assign CG = Seg[6];
//assign DP = 1'b1; // turn off the dot point on seven segs


endmodule :FPGA