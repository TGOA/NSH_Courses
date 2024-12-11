`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 10:39:32 AM
// Design Name: 
// Module Name: transmitter
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


module transmitter(
    input logic valid, 
    input logic clk, reset,
    input logic en_ctr,
    input logic parity,
    input logic parity_type,
    input logic [7:0] data_in,
    input logic [1:0] mux_select,
    output logic cnt_end,
    output logic Data_out
    );
    
    logic paritybit;
    logic pb;
    logic [7:0] counter;
    
    counter #(.n(8)) (
        .clk(clk),
        .reset(reset),
        .counter(counter),
        .en_cnt(en_ctr)
    );
    
    comparetor #(.n(8)) (
        .x(counter),
        .y(7),
        .cnt_end(cnt_end)
    
    );
    
    shift_register (
        .clk(clk),
        .reset_n(reset),
        .load(valid),
        .Data_out(Data_out),
        .en_cun(en_ctr),
        .dataIn(data_in)
    
    );
    
    mux(
        .a(4'b0001),
        .b(4'b0000),
        .c(Data_out),
        .d(paritybit),
        .sel(mux_select),
        .out(Data_out)
    
    );
    
    d_flip_flop(
        .clk(clk),
        .reset(reset),
        .d(1'b0),
        .en(parity&Data_out),
        .q(pb)
    ); 
    
    assign paritybit = pb ^ parity_type;
    
    
    
    
    
    
endmodule
