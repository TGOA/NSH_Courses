`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 10:07:04 AM
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
    input logic clk, reset, valid, cnt_end,
    output logic [1:0]mux_select,
    output logic  en_ctr,  done
    );
    
    typedef enum logic[2:0] {
        idle, 
        start,
        data,
        parity
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
                idle: next_state = valid ? start: idle;
                start: next_state = data;
                data:  next_state = cnt_end ? parity: data;
                parity: next_state = idle;
                default: next_state = idle; 
            endcase
        end
        
        always @(*) begin 
            case(current_state) 
                idle: begin 
                    mux_select = 0;
                    en_ctr = 0;
                    done = 0;
                
                end
                
                start: begin 
                    mux_select = 2'b01;
                    en_ctr = 0;
                    done = 0;
                end
                
                data:begin 
                    mux_select = 2'b10;
                    en_ctr = 1;
                    done = 0;
                
                end
                
                parity: begin 
                    mux_select = 2'b11;
                    en_ctr = 0;
                    done = 1;
                
                end
            
            endcase
            
        
        end
            
    
endmodule
