`timescale 1ns / 1ps


module tb_counter;
    localparam n= 5;
    logic en_x, clk, reset;
    logic [n-1: 0] counter;
    
counter1 DUT(
            .en_x(en_x),
            .clk(clk),
            .reset(reset),
            .counter(counter)
            );
        always #5 clk=~clk;
        initial begin
        clk=0; reset=0; 
        #1 ;
         reset=1;    
        #5;
        repeat (11) begin
        @(negedge clk  );
        end
        en_x=1;
         
         repeat (11) begin
        @(negedge clk  );
        end
        en_x=0;
         
         repeat (11) begin
        @(negedge clk  );
        end
        reset= 0;
        en_x=1;
        
        
        end
endmodule
