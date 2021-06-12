/* fetch_tb_1.sv
* Authors:
* Adem Yıldız
* Emre Boran Karabey
* First testbench for Instruction Fetch Unit
*/

module fetch_tb_1();
        logic clk, reset;
        logic [31:0] pc;
        logic pc_update;
        logic [31:0] pc_new;
    logic [31:0] mem[0:63]; //5 bitlik giristen dolayı 32x64
    logic [31:0] komut;
    assign komut = mem[pc[29:0]];

    fetch_rtl fetch0(.clk(clk), .reset(reset), .pc(pc), .pc_update(pc_update), .pc_new(pc_new));
    always
    begin
        clk = 1; #5;
        clk = 0; #5;
    end
    initial
    begin

mem[0] = 32'd1;
mem[4] = 32'd2;
mem[8] = 32'd3;
mem[12] = 32'd4;
mem[16] = 32'd5;
    pc_update = 0; pc_new = 32'b0; reset = 0;
    #20;
    reset = 1;
    #50;
    pc_new = 32'd128; pc_update = 1;
    #20;
    pc_update = 0;
    #50;
    $stop;
    end
endmodule