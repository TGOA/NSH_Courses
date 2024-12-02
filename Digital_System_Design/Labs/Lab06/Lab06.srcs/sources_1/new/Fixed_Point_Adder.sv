`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 02:37:54 PM
// Design Name: 
// Module Name: Fixed_Point_Adder
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 02:37:54 PM
// Design Name: 
// Module Name: Fixed_Point_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Fixed-point addition with dynamic alignment
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Fixed_Point_Adder #(
    parameter int n1 = 4, 
    parameter int m1 = 4, 
    parameter int n2 = 4, 
    parameter int m2 = 4
)(
    input logic [m1 + n1 - 1 : 0] A,
    input logic [m2 + n2 - 1 : 0] B,
    output logic [((m1 > m2 ? m1 : m2) + (n1 > n2 ? n1 : n2)) - 1 : 0] result
);
    localparam int max_m = (m1 > m2) ? m1 : m2;
    localparam int max_n = (n1 > n2) ? n1 : n2;
    localparam int min_m = (m1 > m2) ? m2 : m1;
    localparam int min_n = (n1 > n2) ? n2 : n1;

    logic [max_m + max_n - 1 : 0] aligned_A, aligned_B;

    always_comb begin
        if (m1 > m2) begin
            aligned_A = A;
            aligned_B = {B, {(m1 - m2){1'b0}}}; 
        end else if (m2 > m1) begin
            aligned_A = {A, {(m2 - m1){1'b0}}}; 
            aligned_B = B;
        end else begin
            aligned_A = A;
            aligned_B = B;
        end
    end

    always_comb begin
        result = aligned_A + aligned_B;
    end
endmodule
