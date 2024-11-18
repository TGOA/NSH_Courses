`timescale 1ns / 1ps

module tb_seven_seg_decoder;

logic [3:0]b;
logic [3:0]i;
logic [6:0]s;

seven_seg_decoder dut(.bin(b), .seg(s));

initial begin

for(i = 0; i <=14 ; i++)
begin
    b = i;
    #1;
    $display("%b\t %b", b, s);
end

#10;
$finish;

end
endmodule