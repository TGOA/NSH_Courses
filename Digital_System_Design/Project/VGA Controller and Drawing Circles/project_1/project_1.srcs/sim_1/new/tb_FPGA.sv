`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 06:17:34 PM
// Design Name: 
// Module Name: tb_FPGA
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


module tb_FPGA;

logic CLK100MHZ, CPU_RESETN, BTNC, BTND, VGA_VS, VGA_HS, VGA_R, VGA_G, VGA_B;
 FPGA DUT(
    CLK100MHZ,    // using the same name as pin names
    CPU_RESETN,
    BTNC, 
    BTND,   
//    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    VGA_VS,
    VGA_HS,
    VGA_R,
    VGA_G,
     VGA_B
//    output wire [7:0] AN,    
//    input wire [15:0] SW     
);

    always
    #10 CLK100MHZ=~CLK100MHZ;


    initial begin 
    CLK100MHZ = 0;
    CPU_RESETN = 0;
    
    BTNC = 0;
    BTND = 0;
    #10;
    CPU_RESETN=1;
    #100;
    BTNC=1;
    
    end
    
    


endmodule
