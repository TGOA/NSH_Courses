//`timescale 1ns / 1ps

//module tb_transmitter;
//                    logic valid;            
//                    logic clk, reset;       
//                    logic en_ctr;           
//                    logic parity;           
//                    logic parity_type;     
//                    logic [7:0] data_in;    
//                    logic [1:0] mux_select; 
//                    logic cnt_end;         
//                    logic Data_out;
//                transmitter DUT (
                                 
                                 
//                                  );





        
                    
                  
//endmodule
`timescale 1ns/1ps

module transmitter_tb;

    // Inputs
    logic valid;
    logic clk;
    logic reset;
    logic en_ctr;
    logic parity;
    logic parity_type;
    logic [7:0] data_in;
    logic [1:0] mux_select;

    // Outputs
    logic cnt_end;
    logic Data_out;

    transmitter uut (
        .valid(valid),
        .clk(clk),
        .reset(reset),
        .en_ctr(en_ctr),
        .parity(parity),
        .parity_type(parity_type),
        .data_in(data_in),
        .mux_select(mux_select),
        .cnt_end(cnt_end),
        .Data_out(Data_out)
    );
    controller cut(
                    .
    
    
    
                    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 0;
        valid = 0;
        en_ctr = 0;
        parity = 0;
        parity_type = 0;
        data_in = 8'b0;
        mux_select = 2'b0;

        #10 reset = 0;
        #10 reset = 1;

        valid = 1;
        data_in = 8'b10101010;
        en_ctr = 1;
        parity = 1;
        parity_type = 0; 
        mux_select = 2'b00;
        #20;

        mux_select = 2'b01;
        #20;
        mux_select = 2'b10;
        #20;
        mux_select = 2'b11;
        #20;

        en_ctr = 0;
        #20;

        parity_type = 1;
        #20;

        $finish;
    end

endmodule
