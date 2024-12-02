`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2024 02:38:43 PM
// Design Name: 
// Module Name: tb_full_adder4bit
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


module tb_full_adder4bit;

    // Inputs to the DUT (Design Under Test)
    logic [3:0] A, B;
    logic cin;

    // Outputs from the DUT
    logic cout;
    logic [3:0] sum;

    // Instantiate the DUT
    full_addre_4bit dut (
        .A(A),
        .B(B),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    // Testbench logic
    initial begin
        $display("Time\tA\tB\tcin\tcout\tsum");

        // Test case 1
        A = 4'b0000; B = 4'b0000; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, sum);

        // Test case 2
        A = 4'b0001; B = 4'b0010; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, sum);

        // Test case 3
        A = 4'b1111; B = 4'b0001; cin = 1'b1;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, sum);

        // Test case 4
        A = 4'b1010; B = 4'b0101; cin = 1'b1;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, sum);

        // Test case 5
        A = 4'b0110; B = 4'b1001; cin = 1'b0;
        #10;
        $display("%0d\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, cout, sum);

        $finish;
    end

endmodule
