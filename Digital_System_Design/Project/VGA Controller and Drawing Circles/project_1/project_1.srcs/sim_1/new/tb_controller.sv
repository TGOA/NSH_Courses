`timescale 1ns / 1ps

module tb_controller ;
        logic clk ; logic reset ; logic btnc ; logic fini ; logic btnd;
        logic en_x; logic plot; logic colour_signal;
           typedef enum logic {
        idle, 
        black,
        colour
    }state_t;
    state_t current_state,next_state;
controller2 dut(
        .clk(clk),
        .reset(reset),
        .btnc(btnc),
        .fini(fini),
        .btnd(btnd),
        .en_x(en_x),
        .plot(plot),
        .colour_signal(colour_signal)        
                );
                assign current_state = dut.current_state;
                assign next_state = dut.next_state;
        
        always #5 clk=~clk;
        initial begin
        clk=0; reset=1; #1 ; reset=0; #1; reset=1; #1;
        #5;
//        repeat (10) begin
//        @(negedge clk);
        btnc=1;
        fini=1;
        #5;
        reset=1;
        #5;
        btnd=1;
        #5;
        $finish;
//        end
        end

endmodule