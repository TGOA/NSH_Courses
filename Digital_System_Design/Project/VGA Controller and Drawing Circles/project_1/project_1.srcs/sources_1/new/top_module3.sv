///////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 07:10:16 PM
// Design Name: 
// Module Name: top_module2
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


module top_module3(
    input logic clk, reset, en_x, en_y, plot,
    input logic [7:0 ] x_counter_input , y_counter_input,
    output logic [7:0] x_value, y_value
    );
    logic [2:0] instruction_value;
    logic comparator_signal, less_than_signal;
    logic x_mux_sele, y_mux_sele;
    logic [7:0] x_output, y_output;
    logic x_alu_select, y_alu_select;
    logic [8:0] x_alu_result, y_alu_result;
    logic [7:0] d, d_out;
    logic d_select;
    
    
      counter1 #(.n(8)) x_counter(
        .clk(clk),
        .reset(reset),
        .en_x(en_x),
        .counter(x_value),
        .value(x_counter_input)
    );
    
   counter1 #(.n(8)) y_counter(
        .clk(clk),
        .reset(reset),
        .en_x(en_y),
        .counter(y_value),
        .value(y_counter_input)
        
    );
    
    counter1 #(.n(8)) instruction_counter(
        .clk(clk),
        .reset(reset),
        .en_x(~comparator_signal),
        .counter(instruction_value),
        .value(0)
    );
    
     comparetor #(.n(3)) instruction_comparator (
        .x(instruction_value),
        .y(8),
        .signal(comparator_signal)
        
   
    
    );
    less_than_comparator #(.n(8)) xy_less_than_comparator(
        .x(x_alu_result),
        .y(y_alu_result),
        .less_than_signal(less_than_signal)
    
    
    );
    ALU #(.n(8)) x_alu (
        .a(80),
        .b(x_output),
        .op_select(x_alu_select),
        .result(x_alu_result)
    
    );
    
    mux x_mux (
      .a(x_value),
      .b(y_value),
      .sel(x_mux_sele),
      .y(x_output)
    
    );
    
     ALU #(.n(8)) y_alu (
        .a(80),
        .b(y_output),
        .op_select(y_alu_select),
        .result(y_alu_result)
    
    );
    
    mux y_mux (
      .a(x_value),
      .b(y_value),
      .sel(y_mux_sele),
      .y(y_output)
    
    );
    
    controller3 fsm (
    
        .clk(clk),
        .reset(reset),
        .incstruction_comparator(comparator_signal),
        .xy_comparator(less_than_signal),
        .steps(instruction_value),
        .d(d),
        .d_select(d_select),
        .x_alu(x_alu_select),
        .y_alu(y_alu_select),
        .x_mux(x_mux_sele),
        .y_mux(y_mux_sele),
        .plot(plot),
        .en_x(en_x),
        .en_y(en_y)
    
    );
    
    d_block d_calc (
        .d(d),
        .x(x_alu_result),
        .y(y_alu_result),
        .d_out(d_out),
        .d_select(d_select)
    
    );
    
    
endmodule
