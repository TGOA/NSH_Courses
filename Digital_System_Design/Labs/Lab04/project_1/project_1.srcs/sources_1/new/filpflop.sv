`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 04:18:04 PM
// Design Name: 
// Module Name: filpflop
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


module flipflop(input d, input en, input reset, output q, output p);
logic w, w2;
logic r;
Dlatch master(
.d(d),
.en(~en),
.q(w2),
.reset(reset),
.p(w)
);
Dlatch slave (
.d(w2),
.en(en),
.q(q),
.reset(reset),
.p(p)
);
endmodule
