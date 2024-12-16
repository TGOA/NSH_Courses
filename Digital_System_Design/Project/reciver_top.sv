`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 09:29:52 PM
// Design Name: 
// Module Name: receiverDP
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


module receiverDP(
    input clk, reset,
    input in,  parityType, parity,
    output logic [7:0] out
    );
    
    logic [2:0] eightSctr, eightDctr;
    logic [3:0] fifteenSctr;
    logic parBit, startS, Dfinished, Sfinished, parityBitff, enpb, enSctr, enDctr, clrs, shiftBit, inpar;
    
    nBitCtr #(3) startSampling(clk, (reset | in), in, (~in), eightSctr);
    nBitCtr #(4) dataSampling(clk, reset, 1'b0, enSctr, fifteenSctr);
    nBitCtr #(3) datacounter(clk, reset, 1'b0, enDctr, eightDctr);
    invDff parDff (
      .clk(clk),
      .reset(reset),
      .en(Sfinished & ~enpb), // This is the enable input
      .q(parityBitff)         // This is the output
    );
    shiftReg #(8) buffer(clk, reset, clrs, in, shiftBit, out);
    dff inparDiff(clk, reset, clrs, enpb, in, inpar);
    
    

    assign startS = (7 == eightSctr);
    assign Sfinished = (15 == fifteenSctr);
    assign Dfinished = (7 == eightDctr);
    assign parBit = ~(inpar ^ (parityBitff ^ parityType));

    recieverCtrl rCtrl(clk, reset, in, parBit, startS, parity, Dfinished, Sfinished, enSctr, enDctr, clrs, shiftBit, enpb);
    
    
endmodule