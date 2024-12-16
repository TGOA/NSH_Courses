`timescale 1ns / 1ps

module tb_transmitter;

    // Inputs
    logic valid;
    logic clk;
    logic reset;
    logic parity;
    logic parity_type;
    logic [7:0] data_in;
//  logic [1:0] mux_select;

    // Outputs
    logic cnt_end;
    logic Data_out;
    

    // Clock generation
    always #5 clk = ~clk;

    // Instantiate the transmitter module
    transmitter uut (
        .valid(valid),
        .clk(clk),
        .reset(reset),
        .parity(parity),
       // .parity_type(parity_type),
        .data_in(data_in),
//        .mux_select(mux_select),
       // .cnt_end(cnt_end),
        .Data_out(Data_out)
    );

    // Testbench logic
    initial begin
        // Initialize inputs
        
        clk = 0;
        reset = 1;
        valid = 0;
        parity = 0;
        parity_type = 0;
        data_in = 8'b0;
//        mux_select = 2'b0;

        // Apply reset
        #10;
        reset = 0;
        #10;
        reset = 1;
        #5;
        // Test case 1: Load data and enable counter
        valid = 1;
        data_in = 8'b10111010;
//        mux_select = 2'b10;
        parity = 1;
        parity_type = 0; // Even parity
        #20;
        valid = 0;

        // Test case 2: Change parity type
        parity_type = 1; // Odd parity
        #20;

        // Test case 3: Test mux select for different outputs
//        mux_select = 2'b00;
//        #10;
//        mux_select = 2'b01;
//        #10;
//        mux_select = 2'b11;
//        #10;

        // Test case 4: Check counter end behavior
        #100;

        // Finish simulation
        $stop;
    end

endmodule