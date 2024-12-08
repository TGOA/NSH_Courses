`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module counter1 #(parameter n = 8 )(
    input logic en_x, clk, reset,
    input logic [n - 1: 0] value,
    output logic [n-1: 0] counter
);
    
    
    always @(posedge clk, negedge reset) begin 
        if (~reset) begin
            counter <= value;
        end
        else if(en_x == 1)  begin
            counter <= counter +1;
       end

    end
    
    
endmodule


