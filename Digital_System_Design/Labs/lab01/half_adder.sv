module half_adder (
input logic a,
input logic b,
output logic s,
output logic cout

);

xor sum(s, a, b);
and carryout(cout, a, b);
endmodule