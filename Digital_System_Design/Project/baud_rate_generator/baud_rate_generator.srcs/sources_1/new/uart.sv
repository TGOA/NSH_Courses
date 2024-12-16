`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2024 07:46:01 PM
// Design Name: 
// Module Name: uart
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


module uart(
        
        input logic valid, clk, reset, parity,
        input logic[7:0] data_in,
        output logic Data_out,
        output logic[7:0] data

    );
    logic baud_clk_tx, baud_clk_rx;
    
    transmitter tx(
        .valid(valid),
        .clk(baud_clk_tx),
        .reset(reset),
        .parity(parity),
        .data_in(data_in),
        .Data_out(Data_out)
    );
    
    receiverDP rx (
        .clk(baud_clk_rx),
        .reset(reset),
        .in(Data_out),
        .out(data)
    );
    
    baud_rate_generator uart_clk(
        .clk(clk),
        .reset_n(reset),
        .baud_clk_tx(baud_clk_tx),
        .baud_clk_rx(baud_clk_rx)
    

    );
    
    
    
endmodule
