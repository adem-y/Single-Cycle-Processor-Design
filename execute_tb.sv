/* execute_tb.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Testbench for Execute Unit
*/

`timescale 1ns/1ps
module tb_lab8_gEBK_p3();
logic [31:0] rs1_data, rs2_data;
logic [31:0] imm;
logic [6:0] opcode;
logic [3:0] func;
logic [31:0] sonuc;
logic pc_update;
logic we;
logic hata;

execute_rtl alu0(.rs1_data(rs1_data), .rs2_data(rs2_data), .imm(imm), .opcode(opcode), .func(func), .sonuc(sonuc), .pc_update(pc_update), .we(we), .hata(hata));

initial
begin
    rs1_data = 32'd4; rs2_data = 32'd7; imm = 32'd2;
    
    opcode = 7'b0000001;
    func = 4'b0000; #50;
    func = 4'b1000; #50;
    func = 4'b0111; #50;
    func = 4'b0110; #50;

    rs1_data = 32'd6; rs2_data = 32'd5; imm = 32'd2;
    func = 4'b0100; #50;
    func = 4'b0001; #50;
    func = 4'b0101; #50;
    func = 4'b1101; #50;
    
    opcode = 7'b0000011;
    func = 4'b0000; #50;
    func = 4'b0111; #50;
    func = 4'b0110; #50;

    rs1_data = 32'd28; rs2_data = 32'd3; imm = 32'd2;
    func = 4'b0100; #50;
    func = 4'b0001; #50;
    func = 4'b0101; #50;
    
    opcode = 7'b0000111;
    #10;
    opcode = 7'b0001111;
    func = 4'b0011; #50;
    func = 4'b0000; #50;
    rs1_data = 32'd0; rs2_data = 32'd16; imm = 32'd2;

    func = 4'b0001; #50;
    func = 4'b0100; #50;
    rs1_data = 32'd24; rs2_data = 32'd10; imm = 32'd2;
    func = 4'b0101; #50;
    func = 4'b0110; #50;

    rs1_data = 32'd30;rs2_data = 32'd21; imm = 32'd2;
    func = 4'b0111; #50;
    $stop;
end

endmodule