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
    input logic parity,
    input logic parity_type,
    input logic [7:0] data_in,
    output logic cnt_end,
    output logic Data_out
    );
    
    logic [1:0] mux_select;
    logic paritybit;
    logic pb;
    logic [2:0] counter;
    logic Dout;
    logic en_ctr;
    logic delayedWhatever;
    
    always @(posedge clk , negedge reset) begin
        if (~reset)
            delayedWhatever = 0;
        else
            delayedWhatever = cnt_end;
    end
    
    counter #(.n(3)) counter1(
        .clk(clk),
        .reset(reset),
        .counter(counter),
        .en_cnt(en_ctr)
    );
    
    comparetor #(.n(3)) counter2 (
        .x(counter),
        .y(3'd7),
        .cnt_end(cnt_end)
    
    );
    
    shift_register shiftting(
        .clk(clk),
        .reset_n(reset),
        .load(valid),
        .Data_out(Dout),
        .en_cun(en_ctr),
        .dataIn(data_in)
    
    );
    
    mux mux1(
        .a(1'b1),
        .b(1'b0),
        .c(Dout),
        .d(paritybit),
        .sel(mux_select),
        .out(Data_out)
    
    );
    
    d_flip_flop flip(
        .clk(clk),
        .reset(reset),
        .d(1'b0),
        .en(parity&Data_out),
        .q(pb)
    ); 
    
    controller fsm(
    .clk(clk),
    .reset(reset),
    .valid(valid),
    .cnt_end(delayedWhatever),
    .mux_select(mux_select),
    .en_ctr(en_ctr)    
    
    );
    
    
    
    
    assign paritybit = pb ^ parity_type;
    
    
    
    
    
    
endmodule
