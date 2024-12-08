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
    input clk, btnc, reset, incstruction_comparator, xy_comparator, 
    input [2:0] steps,
    input [5:0] d,
    output logic d_select, x_alu, y_alu, x_mux, y_mux, plot, en_x, en_y
);

    typedef enum logic [2:0] {
        idle, 
        colour,
        dcalc
    } state_t;

    // State register
    state_t current_state, next_state;

    // State transition logic
    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            current_state <= idle;
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            idle:   next_state = btnc ? colour : idle;
            colour: next_state = incstruction_comparator ? dcalc : colour;
            dcalc:  next_state = xy_comparator ? colour : idle;
            default: next_state = idle;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values to avoid latch inference
        en_x = 0;
        en_y = 0;
        plot = 0;
        d_select = 0;
        x_mux = 0;
        y_mux = 0;
        x_alu = 0;
        y_alu = 0;

        case (current_state)
            idle: begin 
                // Outputs remain in default state
            end
            
            colour: begin 
                en_x = 1;
                plot = 1;
                d_select = 0;

                case (steps) 
                    0: begin 
                        x_mux = 0;
                        y_mux = 1;
                        x_alu = 0;
                        y_alu = 0;
                    end
                    1: begin 
                        x_mux = 0;
                        y_mux = 1;
                        x_alu = 1;
                        y_alu = 0;
                    end
                    2: begin 
                        x_mux = 0;
                        y_mux = 1;
                        x_alu = 0;
                        y_alu = 1;
                    end
                    3: begin 
                        x_mux = 0;
                        y_mux = 1;
                        x_alu = 1;
                        y_alu = 1;
                    end
                    4: begin 
                        x_mux = 1;
                        y_mux = 0;
                        x_alu = 0;
                        y_alu = 0;
                    end
                    5: begin 
                        x_mux = 1;
                        y_mux = 0;
                        x_alu = 1;
                        y_alu = 0;
                    end
                    6: begin 
                        x_mux = 1;
                        y_mux = 0;
                        x_alu = 0;
                        y_alu = 1;
                    end
                    7: begin 
                        x_mux = 1;
                        y_mux = 0;
                        x_alu = 1;
                        y_alu = 1;
                    end
                endcase
            end
            
            dcalc: begin 
                en_x = 0;
                plot = 0;
                if (d < 0 ) begin 
                    en_y = 0;
                    d_select = 0;
                end
                else 
                    en_y = 1;
                    d_select = 1;
                
            end
        endcase
    end

endmodule
