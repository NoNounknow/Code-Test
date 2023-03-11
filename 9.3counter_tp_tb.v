`timescale 1ns/1ns
`define clock_period 20
module counter_ip_tb;
    reg             cin;//进位输入
    reg             clock;
    wire            cout;//进位输出
    wire    [3:0]   q;

    counter counter_inst0(
                                .cin(cin),
                                .clock(clock),
                                .cout(cout),
                                .q(q));
    initial clock = 0;
    always  #(`clock_period/2) clock = ~clock;

    initial
    begin
         repeat(5)   
              begin
                    cin = 0;
                    #(`clock_period*5)  cin = 1;
                    #(`clock_period*1)  cin = 0;
              end
        #(`clock_period*200);    
        $stop;
    end
endmodule