`timescale   1ns/1ns
`define     clock_period 20;
module  block_tb;
    reg               Rst_n;
    reg               Clk;
    reg               a;
    reg               b;
    reg               c;
    wire    [1:0]     out;

    block   block_inst0(
                        .Rst_n(Rst_n),
                        .Clk(),
                        .a(a),
                        .b(b),
                        .c(c),
                        .out(out)
                            );
    initial Clk = 0;
    always 
        #(`clock_period/2) Clk = ~Clk;

    initial
        begin
            
        end