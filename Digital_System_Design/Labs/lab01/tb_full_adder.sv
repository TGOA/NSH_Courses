module tb_full_adder;
    logic a, b, cin;
    logic s, cout;

    // Instantiate the full adder
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $display("Time\t a\t b\t cin\t s\t cout");
        $display("-------------------------------------");

        a = 0; b = 0; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 0; b = 0; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 0; b = 1; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 0; b = 1; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 1; b = 0; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 1; b = 0; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 1; b = 1; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        a = 1; b = 1; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t %b\t %b", $time, a, b, cin, s, cout);

        $finish;
    end
endmodule
