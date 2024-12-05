`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 07:10:16 PM
// Design Name: 
// Module Name: top_module2
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


module top_module2(

    input logic clk, reset, btnc, btnd
    );
    logic [2:0]color;
    logic [7:0] counterxbus;
    logic [6:0] counteryby;
    logic compy_out,compx_out;
    logic en_x;
    logic plot;
    logic colour_signal;
    logic x_reset, y_reset, fnsh;
    assign x_reset = ~reset |  compx_out;
    assign y_reset = ~reset |  compy_out;
    assign fnsh = compy_out & compx_out;
    
            vga_core moin(.clk(clk), .resetn(reset), .x(counterxbus), .y(counteryby), .plot(), .VGA_R(), .VGA_G(), .VGA_B(), .VGA_VS(), .VGA_HS());

    counter1 #(.n(8)) x_counter(
        .clk(clk),
        .reset(x_reset),
        .en_x(en_x),
        .counter(counterxbus)
    );
    
    counter1 #(.n(8)) y_counter(
        .clk(clk),
        .reset(y_reset),
        .en_x(compx_out),
        .counter(counteryby)
    );
     comparetor #(.n(8)) x_comparetor (
        .x(counterxbus),
        .y(159),
        .signal(compx_out)
    
    );
    
      
     comparetor #(.n(7)) y_comparetor (
        .x(counteryby),
        .y(119),
        .signal(compy_out)
    
    );
    
        
    controller2 fsm (
     .clk(clk),
     .reset(reset),
     .btnc(btnc),
     .btnd(btnd),
     .en_x(en_x),
     .fini(fnsh),
     .plot(plot),
     .colour_signal(colour_signal)
    ); 
    
    assign color = colour_signal ? counteryby [2:0]: 0;
    

    
endmodule
