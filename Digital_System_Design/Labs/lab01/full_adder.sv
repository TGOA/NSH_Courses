module full_adder (
    input logic a,
    input logic b,
    input logic cin,
    output logic s,
    output logic cout
);
    logic s1, c1, c2;

    half_adder ha1(
        .a(a),
        .b(b),
        .s(s1),
        .cout(c1)
    );

    half_adder ha2(
        .a(s1),
        .b(cin),
        .s(s),
        .cout(c2)
    );

    assign cout = c1 | c2;
endmodule
