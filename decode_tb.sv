/* decode_tb.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Testbench for Instruction Decode Unit
*/

`timescale 1ns/1ps

module tb_lab8_gEBK_p2();
    logic clk, reset;
    logic [6:0] opcode;
    logic [3:0] func;
    logic pc_update;
    logic [31:0] komut;
    logic [31:0] pc;
    logic [31:0] pc_new;
    logic [31:0] rs1_data;
    logic [31:0] rs2_data;
    logic [31:0] imm;
    logic hata;
    logic we;
    logic [31:0] rd_data;
    logic [31:0] memory_fib20 [0:63]; //hafıza
    assign komut = memory_fib20[pc[29:0] >> 2];

    decode_rtl decode0(.clk(clk), .reset(reset), .komut(komut), .opcode(opcode), .func(func), .rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .hata(hata), .we(we), .rd_data(rd_data));
    fetch_rtl fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(pc_new));

    always
    begin
        clk = 1; #5;
        clk = 0; #5;
    end
    initial
    begin
        $readmemb("C:\\Users\\boran\\Desktop\\Quartus\\fib20.mem", memory_fib20); //dosya yükleme

        reset = 0; #3; //resetleme
        reset = 1; #2;
        #120; //çalışma süresi
        $stop; //çalışmanın durdurulması
    end
endmodule