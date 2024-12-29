`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 05:07:00 PM
// Design Name: 
// Module Name: alu_controller
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

module alu_control (
    input  logic [1:0]  alu_op,
    input  logic [6:0]  fun7,
    input  logic [2:0]  fun3,
    output logic [3:0]  alu_ctrl
);

    always_comb begin
        alu_ctrl = 4'b0000; 

        case (alu_op)
           //load and store
            2'b00: begin
                alu_ctrl = 4'b0000; 
            end

            // branches 
            2'b01: begin
                alu_ctrl = 4'b1000; 
            end

            // R type 
            2'b10: begin
                alu_ctrl = { fun7[5], fun3 };
            end

            // I type 
            2'b11: begin
                alu_ctrl = { fun7[5], fun3 };
            end
        endcase
    end

endmodule

