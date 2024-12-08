`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2024 01:16:18 PM
// Design Name: 
// Module Name: controller3
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


module controller3(
  input clk, reset, btnc,  Fcalk, comp_d, xycomp,
  input [2:0] steps, 
  output logic en_x, plot,en_y, d_select, xmux_select, ymux_select, xalu_select, yalu_select 
      );
      
      typedef enum logic [2:0] {still,cir,dcalk} state_t;      
      state_t current_state, next_state;

      always@(posedge clk, negedge reset) begin
      if(reset==0) begin
      current_state <= still;
     end else begin
     current_state <= next_state;
     end
     end
     
     
     
   always@(*) begin 
   case(current_state) 
    still: next_state = btnc ? cir: still;
    cir: next_state =  comp_d?  dcalk :cir;
    dcalk: next_state = Fcalk? cir: dcalk;
endcase
end
 always@(*) begin
        case(current_state)
            still: begin
                en_x = 0;
                en_y = 0;
                plot = 0;
                d_select = 0;
                xmux_select = 0;
                ymux_select = 0;
                xalu_select = 0;
                yalu_select = 0;
              end
              
             cir: 
              begin
                en_x = 1;
                en_y = 0;
                plot = 1;
                d_select = 1;
                case (steps)
                   0: begin 
                xmux_select = 0;
                ymux_select = 0;
                xalu_select = 0;
                yalu_select = 0;
                end
                1: begin 
                xmux_select = 0;
                ymux_select = 0;
                xalu_select = 1;
                yalu_select = 0;
                end
                2: begin 
                xmux_select = 0;
                ymux_select = 0;
                xalu_select = 0;
                yalu_select = 1;
                end
                3: begin 
                xmux_select = 0;
                ymux_select = 0;
                xalu_select = 1;
                yalu_select = 1;
                end
                4: begin 
                xmux_select = 1;
                ymux_select = 1;
                xalu_select = 0;
                yalu_select = 0;
                end
                5: begin 
                xmux_select = 1;
                ymux_select = 1;
                xalu_select = 1;
                yalu_select = 0;
                end
                6: begin 
                xmux_select = 1;
                ymux_select = 1;
                xalu_select = 0;
                yalu_select = 1;
                end
                7: begin 
                xmux_select = 1;
                ymux_select = 1;
                xalu_select = 1;
                yalu_select = 1;
                end
                endcase
                end
               dcalk: 
                begin
                    en_x = 0;
                    en_y = 1;
                    plot = 0;
                end
    
        endcase
        end
    
endmodule
