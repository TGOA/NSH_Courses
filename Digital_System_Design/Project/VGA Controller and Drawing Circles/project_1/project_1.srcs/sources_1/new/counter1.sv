`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module counter1 #(parameter n = 8 )(
    input logic en_x, clk, reset,
    output logic [n-1: 0] counter
);
    
    
    always @(posedge clk, negedge reset) begin 
        if (~reset) begin
            counter <= 0;
        end
        else if(en_x==1)  begin
            counter <= counter +1;
       end
        else begin
        counter <= counter ;
        end
    end
    
    
endmodule
