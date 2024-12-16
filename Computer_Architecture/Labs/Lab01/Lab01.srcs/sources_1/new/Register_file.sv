`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 01:42:28 PM
// Design Name: 
// Module Name: Register_file
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


module Register_file #(parameter n = 8)(
    input logic clk,
    input logic [1:0] rs1,rs2,
    input logic [n - 1: 0 ] alu_result,
    input logic [1 : 0] rd,
    output logic [n -1 : 0] op1, op2
    );
    
    logic [n - 1:0] Registers [3 :0];

    initial  begin 
    
    $readmemb("/home/it/eda_training/Computer_Architecture/Labs/fib_rf.mem", Registers);
    end
    
    
    always_comb begin 
        case (rs1)
        2'b00: op1 = Registers[0];
        2'b01: op1 = Registers[1];
        2'b10: op1 = Registers[2];
        2'b11: op1 = Registers[3];
        default: op1 = Registers[0];
        endcase
        
        
    
    end
    
        always_comb begin 
        case (rs2)
        2'b00: op2 = Registers[0];
        2'b01: op2= Registers[1];
        2'b10: op2 = Registers[2];
        2'b11: op2 = Registers[3];
        default: op2 = Registers[0];
        endcase
        
        end
        
     always @(posedge clk) begin 
        case(rd)
        2'b01: Registers[1]= alu_result;
        2'b10: Registers[2]= alu_result;
        2'b11: Registers[3] = alu_result;
        default: Registers[0] = 0;
        endcase
     
     end
     
     // hardwire reg0 to groud 
     assign Registers[0] = 0;
    
    
    
    
endmodule
