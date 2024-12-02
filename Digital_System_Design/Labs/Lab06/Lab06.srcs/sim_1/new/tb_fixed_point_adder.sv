`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 03:24:15 PM
// Design Name: 
// Module Name: tb_fixed_point_adder
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

module tb_fixed_point_adder;

    // Parameters
    parameter int n1 = 4;
    parameter int m1 = 4;
    parameter int n2 = 4;
    parameter int m2 = 4;

    // Inputs
    logic [m1 + n1 - 1 : 0] A;
    logic [m2 + n2 - 1 : 0] B;

    // Outputs
    logic [((m1 > m2 ? m1 : m2) + (n1 > n2 ? n1 : n2)) - 1 : 0] result;

    // Instantiate the Fixed_Point_Adder
    Fixed_Point_Adder #(
        .n1(n1), 
        .m1(m1), 
        .n2(n2), 
        .m2(m2)
    ) uut (
        .A(A),
        .B(B),
        .result(result)
    );

    // Test stimulus
    initial begin
        // Test Case 1: Basic addition
        A = 8'b0001_1000; // 1.5 in fixed-point (n1=4, m1=4)
        B = 8'b0010_0100; // 2.25 in fixed-point (n2=4, m2=4)
        #10;
        $display("Test 1: A = %b, B = %b, Result = %b", A, B, result);

        // Test Case 2: Adding with carry
        A = 8'b1111_0000; // -1.0 in fixed-point (signed representation)
        B = 8'b0001_0001; // 1.0625 in fixed-point
        #10;
        $display("Test 2: A = %b, B = %b, Result = %b", A, B, result);

        // Test Case 3: Different precision
        A = 8'b0001_1000; // 1.5 in fixed-point (n1=4, m1=4)
        B = 16'b0000_0001_0100_0000; // 5.25 in fixed-point (n2=8, m2=8)
        #10;
        $display("Test 3: A = %b, B = %b, Result = %b", A, B, result);

        // End simulation
        $stop;
    end
endmodule

