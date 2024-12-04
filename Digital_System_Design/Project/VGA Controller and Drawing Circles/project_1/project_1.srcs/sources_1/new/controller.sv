`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 04:37:07 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input clk, reset, btnc,fini,
    output logic en_x, plot,
    output logic [2:0] rgb
    );
    
    typedef enum logic {
        idle, 
        black 
    }state_t;
    
    
    state_t current_state, next_state;
    //state register
    always @(posedge clk, negedge reset ) 
        begin
        if (~reset) begin
            current_state <= idle;
            end
         else begin
            next_state <= current_state;
           end

        end
    
    //next state
    always @(btnc, current_state) begin
        
        case(current_state)
            idle: next_state = btnc? black: idle;
            black: next_state = fini ? idle: black;
            default: next_state = idle;
        endcase
   
   
    end
    //output state
    always@(*) begin 
        case (current_state)
        idle: begin 
        en_x  = 0;
        plot = 0;
        rgb = 0;
        end
        black: begin 
        en_x = 1;
        plot = 1;
        rgb = 0;
        end
    
    endcase  
    end
endmodule
