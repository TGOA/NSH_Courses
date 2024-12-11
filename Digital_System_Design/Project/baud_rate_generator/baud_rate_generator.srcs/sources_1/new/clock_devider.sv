module baud_rate_generator #(
    parameter DIV_FACTOR_TX = 10417,
    parameter DIV_FACTOR_RX = 651
)(
    input  logic clk,
    input  logic reset_n,
    output logic baud_clk_tx,
    output logic baud_clk_rx
);
    logic [31:0] counter_tx;
    logic [31:0] counter_rx;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter_tx <= 0;
            baud_clk_tx <= 0;
        end else if (counter_tx == DIV_FACTOR_TX - 1) begin
            counter_tx <= 0;
            baud_clk_tx <= ~baud_clk_tx;
        end else begin
            counter_tx <= counter_tx + 1;
        end
    end

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            counter_rx <= 0;
            baud_clk_rx <= 0;
        end else if (counter_rx == DIV_FACTOR_RX - 1) begin
            counter_rx <= 0;
            baud_clk_rx <= ~baud_clk_rx;
        end else begin
            counter_rx <= counter_rx + 1;
        end
    end
endmodule
