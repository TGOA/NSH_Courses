module shiftReg #(parameter n = 8 ) (
    input clk,
    input reset_n,
    input clear,
    input in,
    input en,
    output logic [n-1:0] q    
);

    logic [n-1:0] shift_reg;

    always_ff @(posedge clk or negedge reset_n) begin
        if (~reset_n | clear) begin
            shift_reg <= 0;
        end else if(en) begin
            shift_reg <= {shift_reg[n-2:0], in};
        end
    end

    assign q = shift_reg;

endmodule