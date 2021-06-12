/* single_cycle_processor_tb.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* Testbench for Single Cycle Processor
*/

`timescale 1ns/1ps
module single_cycle_processor();
logic clk, reset;
logic [31:0] komut;
logic [31:0] pc;
logic hata;
single_cycle_processor dut0(.clk(clk), .reset(reset), .komut(komut), .pc(pc), .hata(hata)); logic [31:0] memory_fib20 [0:63]; //program memory for program counter to pull the instructions

assign komut = memory_fib20[pc[29:0] >> 2];
always
begin clk = 1; #5; clk = 0; #5;
end
initial
begin
    $readmemb("C:\\Users\\boran\\Desktop\\Quartus\\fib20.mem", memory_fib20); //dosya yükleme
    reset = 0; #3; //resetleme
    reset = 1; #2; #1400; //çalışma süresi
    $stop; //çalışmanın durdurulması
end
endmodule