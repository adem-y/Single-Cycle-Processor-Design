/* fetch_tb_2.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Second testbench for Instruction Fetch Unit
*/

`timescale 1ns/1ps

module fetch_tb_2();
    logic clk, reset;
    logic [31:0] pc;
    logic pc_update;
    logic [31:0] pc_new;
    logic [31:0] memory_fib20[0:63]; // hafıza
    logic [31:0] komut;
    assign komut = memory_fib20[pc[29:0] >> 2];

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
        #130; //çalışma süresi
        $stop; //çalışmanın durdurulması
    end
endmodule