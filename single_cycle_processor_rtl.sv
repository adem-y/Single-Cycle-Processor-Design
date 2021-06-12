/* single_cycle_processor_rtl.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Single Cycle Processor
*/

module single_cycle_processor (
    input logic clk, reset,
    input logic [31:0] komut,
    output logic [31:0] pc,
    output logic hata
);

logic we;
logic pc_update;
logic [31:0] rs1_data, rs2_data;
logic [31:0] sonuc;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic hata1, hata2;
assign hata = hata1 | hata2;

fetch_rtl fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(sonuc));
decode_rtl decode0(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .func(func), .rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .we(we), .rd_data(sonuc), .hata(hata1));
execute_rtl alu0(.rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .opcode(opcode), .func(func), .sonuc(sonuc), .pc_update(pc_update), .we(we), .hata(hata2));

endmodule