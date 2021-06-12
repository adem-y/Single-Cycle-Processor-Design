/* decode_rtl.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Instruction Decode Ünitesi
*/

module lab8_gEBK_p2 (
    input logic clk, reset,
    input logic [31:0] komut,
    output logic [6:0] opcode,
    output logic [3:0] func,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data,
    output logic [31:0] imm,
    output logic hata,
    input logic we,
    input logic [31:0] rd_data
);

logic [4:0] rdport;
logic [4:0] rs1port;
logic [4:0] rs2port;
logic [31:0] rs1dataport;
logic [31:0] rs2dataport;

fetch_rtl dut1(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .aluop(func), .rs1_data(rs1dataport), .rs2_data(rs2dataport), .imm(imm), .hata(hata), .rd(rdport), .rs1(rs1port), .rs2(rs2port));
decode_rtl dut2(.clk(clk), .reset(reset), .we(we), .waddr(rdport), .wbdata(rd_data), .rs1(rs1port), .rs2(rs2port), .rs1_data(rs1_data), .rs2_data(rs2_data));

endmodule