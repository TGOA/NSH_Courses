`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2024 01:17:04 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder( input a, input b, input c_in, output s, output c_out );
    logic w1, w2, w3;
    
    half_adder H1(
        .a(a),
        .b(b),
        .c(w1),
        .s(w2)
    );
     half_adder H2(
        .a(c_in),
        .b(w2),
        .c(w3),
        .s(s)
    );
    assign c_out = w3 | w1;
        endmodule
