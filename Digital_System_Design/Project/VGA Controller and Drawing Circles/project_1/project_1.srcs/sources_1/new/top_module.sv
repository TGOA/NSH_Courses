`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 05:13:37 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input reset, clk,btnc
);  

    logic [7:0]counterxbus;
    logic [6:0] counteryby;
    logic en_x, en_y;
    logic [2:0] rgb;
    logic plot;
    logic x_reset, y_reset, y_comp, fini;
    assign x_reset = en_y | ~reset;
    assign y_reset = y_comp | ~reset;
    assign fini = en_y & y_comp;
    
    counter1 #(.n(8)) X_counter(
        .clk(clk),
        .reset(x_reset),
        .counter(counterxbus),
        .en_x(en_x)
    
    );
    
    counter1 #(.n(7)) y_counter(
        .clk(clk),
        .reset(y_reset),
        .counter(counteryby),
        .en_x(en_y)
    
    );
    
    
    controller fsm (
     .clk(clk),
     .reset(reset),
     .btnc(btnc),
     .en_x(en_x),
     .fini(fini),
     .colour_signal(rgb),
     .plot(plot)
     
    ); 
    comparetor #(.n(8)) x_comparetor (
        .x(counterxbus),
        .y(159),
        .signal(en_y)
    
    );
    
     comparetor #(.n(7)) y_comparetor (
        .x(counteryby),
        .y(119),
        .signal(y_comp)
    
    );
    
    
    vga_core moin(.clk(clk), .resetn(reset), .x(), .y(), .plot(), .VGA_R(), .VGA_G(), .VGA_B(), .VGA_VS(), .VGA_HS());
    
endmodule
