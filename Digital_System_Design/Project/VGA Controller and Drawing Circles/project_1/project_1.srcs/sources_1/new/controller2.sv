`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 07:11:22 PM
// Design Name: 
// Module Name: controller2
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


module controller2(
    input clk, reset, btnc,fini, btnd,
    output logic en_x, plot,colour_signal
    );
    typedef enum logic[2:0] {
        idle, 
        black,
        colour
    }state_t;
    
    //state_reg
     state_t current_state, next_state;
     
      always @(posedge clk, negedge reset) 
        begin
        if (~reset) begin
            current_state <= idle;
            end
         else begin
            current_state <= next_state;
           end

        end
        
         always @(*) begin
        case(current_state)
         idle: begin 
            if (btnc)
                next_state = black;
            else if (btnd)
                next_state = colour;
             else 
                next_state = idle;    
            end     
           black: next_state = fini? idle: black;
           colour: next_state = fini ? idle: colour;
            default: next_state = idle;
        endcase
   
   
    end

    //output state
    always@(*) begin
        case(current_state)
            idle: begin
                en_x = 0;
                plot = 0;
                colour_signal = 0;
              end
              
             black: 
              begin
               
                 en_x = 1;
                 plot = 1;
                 colour_signal = 0;
                
                end
               colour: 
                begin
                    en_x = 1;
                    plot = 1;
                    colour_signal = 1;
                end
    
        endcase
        end
    
endmodule
