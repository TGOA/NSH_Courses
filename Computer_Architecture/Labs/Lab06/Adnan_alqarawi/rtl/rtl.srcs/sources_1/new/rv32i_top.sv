`timescale 1ns/1ps

module rv32i_top(
    input  logic clk,
    input  logic reset_n
);

    logic [31:0] pc;
    logic [31:0] next_pc;
    logic [31:0] instruction;
    logic [31:0] imm;
    logic [31:0] reg_read_data1, reg_read_data2;
    logic [31:0] alu_result;
    logic [31:0] mem_read_data;
    logic [3:0]  alu_ctrl;
    logic [6:0]  funct7;
    logic [2:0]  funct3;
    logic [6:0]  opcode;
    logic [4:0]  rs1, rs2, rd;
    logic        zero;
    logic        reg_write, mem_write, mem_to_reg, alu_src, branch;
    logic [1:0]  alu_op;

    program_counter pc_inst (
        .clk     (clk),
        .reset_n (reset_n),
        .data_in (next_pc),
        .data_o  (pc)
    );

    inst_mem imem (
        .address     (pc),
        .instruction (instruction)
    );

    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];
    assign funct3 = instruction[14:12];
    assign rs1    = instruction[19:15];
    assign rs2    = instruction[24:20];
    assign funct7 = instruction[31:25];

    main_control ctrl (
        .opcode     (opcode),
        .reg_write  (reg_write),
        .mem_write  (mem_write),
        .mem_to_reg (mem_to_reg),
        .alu_op     (alu_op),
        .alu_src    (alu_src),
        .branch     (branch)
    );

    imm_gen immg (
        .inst (instruction),
        .imm  (imm)
    );

    alu_control alu_ctrl_unit (
        .alu_op   (alu_op),
        .fun7     (funct7),
        .fun3     (funct3),
        .alu_ctrl (alu_ctrl)
    );

    logic [31:0] reg_write_data;
    reg_file regs (
        .clk       (clk),
        .reset_n   (reset_n),
        .reg_write (reg_write),
        .raddr1    (rs1),
        .raddr2    (rs2),
        .waddr     (rd),
        .wdata     (reg_write_data),
        .rdata1    (reg_read_data1),
        .rdata2    (reg_read_data2)
    );

    logic [31:0] alu_operand2;
    assign alu_operand2 = (alu_src) ? imm : reg_read_data2;

    alu alu_inst (
        .op1      (reg_read_data1),
        .op2      (alu_operand2),
        .alu_ctr  (alu_ctrl),
        .zero     (zero),
        .alu_resul(alu_result)
    );

    data_mem dmem (
        .clk       (clk),
        .reset_n   (reset_n),
        .mem_write (mem_write),
        .addr      (alu_result),
        .wdata     (reg_read_data2),
        .rdata     (mem_read_data)
    );

    assign reg_write_data = (mem_to_reg) ? mem_read_data : alu_result;

    logic [31:0] pc_plus_4;
    assign pc_plus_4 = pc + 4;
    assign next_pc   = (branch & zero) ? (pc + imm) : pc_plus_4;

endmodule
