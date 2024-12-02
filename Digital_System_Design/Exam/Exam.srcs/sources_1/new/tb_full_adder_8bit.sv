`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 03:00:36 PM
// Design Name: 
// Module Name: tb_full_adder_8bit
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


module tb_full_adder_8bit;

    // Inputs to the DUT (Design Under Test)
    logic [7:0] A, B;
    logic cin;

    // Outputs from the DUT
    logic cout, cout2;
    logic [3:0] sum1, sum2;
    logic [7:0] result;

    // Instantiate the DUT
    ful_addre_8bits dut (
        .A(A),
        .B(B),
        .cin(cin),
        .cout(cout),
        .cout2(cout2),
        .sum1(sum1),
        .sum2(sum2),
        .result(result)
    );

    // Testbench logic
    initial begin
        $display("Time\tA\t\tB\t\tcin\tcout\tcout2\tsum1\tsum2");

        // Test case 1
        A = 8'b00000000; B = 8'b00000000; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, cout2, sum1, sum2);

        // Test case 2
        A = 8'b00001111; B = 8'b00000001; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, cout2, sum1, sum2);

        // Test case 3
        A = 8'b11111111; B = 8'b00000001; cin = 1'b1;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, cout2, sum1, sum2);

        // Test case 4
        A = 8'b10101010; B = 8'b01010101; cin = 1'b1;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, cout2, sum1, sum2);

        // Test case 5
        A = 8'b01100110; B = 8'b10011001; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, cout2, sum1, sum2);

        $finish;
    end

endmodule
