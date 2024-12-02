`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 05:03:12 PM
// Design Name: 
// Module Name: fix_poit_mul
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
// Create Date: 11/24/2024 05:03:12 PM
// Design Name: 
// Module Name: fix_point_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Fixed-point multiplication
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fix_point_mul #(
    parameter int n1 = 4,  // Fractional bits for A
    parameter int m1 = 4,  // Integer bits for A
    parameter int n2 = 4,  // Fractional bits for B
    parameter int m2 = 4   // Integer bits for B
)(
    input logic [m1 + n1 - 1 : 0] A,
    input logic [m2 + n2 - 1 : 0] B,
    output logic [m1 + n1 + m2 + n2 - 1 : 0] result
);
    // Intermediate product with full width
    logic [m1 + n1 + m2 + n2 - 1 : 0] raw_product;

    always_comb begin
        // Perform multiplication as integers
        raw_product = A * B;

        // Adjust for fractional point: shift right by (n1 + n2) bits
        result = raw_product >> (n1 + n2);
    end
endmodule


