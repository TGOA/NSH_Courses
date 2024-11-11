module tb_half_adder;
    logic a, b;
    logic s, cout;

    half_adder dut (
        .a(a),
        .b(b),
        .s(s),
        .cout(cout)
    );

    initial begin
        $display("Time\t a\t b\t s\t cout");
        $display("---------------------------------");

        a = 0; b = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b", $time, a, b, s, cout);

        a = 0; b = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b", $time, a, b, s, cout);

        a = 1; b = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b", $time, a, b, s, cout);

        a = 1; b = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b", $time, a, b, s, cout);

        $finish;
    end
endmodule
