`timescale 1ns/1ns
`define clock_period 20
module beep_test_tb;
		reg clk;
		reg rst;
		reg [31:0]cnt_acc;
		reg mode;
		reg cnt_start;
		wire [31:0]count_now;
		wire full;
		
		beep_test 
		U1(
			.clk(clk),
			.rst(rst),
			.cnt_acc(cnt_acc),
			.mode(mode),
			.cnt_start(cnt_start),
			.count_now(count_now),
			.full_r(full)
			);

		initial 
			clk = 1;
		always
			#(`clock_period/2) clk = ~clk;

			
		initial
			begin
				rst = 0;
				cnt_acc = 0;
				mode = 0;
				cnt_start = 0;
			#(`clock_period*20+1);
				rst = 1;
			#(`clock_period*20);

			//设置预设值为1000，模式为循环定时模式
				cnt_acc = 1000;
				mode = 1;
			#(`clock_period*20);
				cnt_start = 1;
			#(`clock_period*12000);//保持时间
				cnt_start = 0;
			#(`clock_period*20);


			//设置预设值为600，模式为循环定时模式
				cnt_acc = 600;
				mode = 1;
			#(`clock_period*20);
				cnt_start = 1;
			#(`clock_period*8000);//保持时间
				cnt_start = 0;
			#(`clock_period*20);


			//设置预设值为1000，模式为单次定时模式
				cnt_acc = 1000;
				mode = 0;
			#(`clock_period*20);
				cnt_start = 1;
			#(`clock_period);//保持时间 单次定时器中不需要维持使能
				cnt_start = 0;
			#(`clock_period*1200);

			//设置预设值为600，模式为循环定时模式
				cnt_acc = 600;
				mode = 0;
			#(`clock_period*20);
				cnt_start = 1;
			#(`clock_period);//保持时间
				cnt_start = 0;
			#(`clock_period*1200);
			$stop;
			end
endmodule

2022.8.2.22.43 2022/8/20 18:56:52
module beep_test
(
	input                      clk,
	input                      rst,
	input [31:0]               cnt_acc,//定时预设值
	input                      mode,//模式切换，mode为1的时候循环定时，mode为0单次定时
	input                      cnt_start,//启动信号,高电平启动低电平停止(使能信号)
	output [31:0]              count_now,//输出计数数值
	output reg                 full_r,//通知信号,当计数满的时候=1
);
		reg oneshot;//单次定时的内部使能信号
		reg [31:0]count;	
		wire full;
		assign count_now = count; 
		assign full =(count == cnt_acc-1)?1:0;//这里如果是>=的话会多记一个时钟周期的高电平
										
				always @(posedge clk)
				begin
					full_r <= full;
				end

2022.8.2.22.43 2022/8/20 18:57:06
你粘贴进去仿真一下呢

module beep_test
(
	clk,rst,
	cnt_acc,//定时预设值
	mode,//模式切换，mode为1的时候循环定时，mode为0单次定时
	cnt_start,//启动信号,高电平启动低电平停止(使能信号)
	count_now,//输出计数数值
	full_r,//通知信号,当计数满的时候=1
			);
	input                      clk;
	input                      rst;
	input [31:0]               cnt_acc;//定时预设值
	input                      mode;//模式切换，mode为1的时候循环定时，mode为0单次定时
	input                      cnt_start;//启动信号,高电平启动低电平停止(使能信号)
	output [31:0]              count_now;//输出计数数值
	output reg                 full_r;//通知信号,当计数满的时候=1
		reg oneshot;//单次定时的内部使能信号
        
		reg [31:0]count;	
		wire full;
		assign count_now = count; 
		assign full =(count == cnt_acc-1)?1:0;//这里如果是>=的话会多记一个时钟周期的高电平
										
				always @(posedge clk)
				begin
					full_r <= full;
				end

module beep_test_top
(
    clk,
    rst,
    mode,
    cnt_start,
            );
    input       clk;
    input       rst;
    input       mode;
    input       cnt_start;

        beep_test U_beep_test0(
            .clk(clk),
            .rst(rst)
            .cnt_acc(49999),
            .mode(mode),
            .cnt_start(cnt_start)
            .count_now(),
            .full_r()
            );


endmodule

module sound_lut
（
    clk,
    arr
        );
    input                clk        ;
    output      [31:0]   arr        ;
    reg         [4:0]    index      ;

        always @(posedge clk)
            if(!index)
                index   <=    0;
            else if(index >= 5'd26)
                index   <=    0;
            else
                index   <=    index+1'b1;

        always @(*)
            begin
                case(index)
                    0 : ARR = 191130;
                    1 : ARR = 170241;
                    2 : ARR = 151689;
                    3 : ARR = 143183;
                    4 : ARR = 127550;
                    5 : ARR = 113635;
                    6 : ARR = 101234;
                    7 : ARR = 95546 ;
                    8 : ARR = 85134 ;
                    9 : ARR = 75837 ;
                    10: ARR = 71581 ;
                    11: ARR = 63775 ;
                    12: ARR = 56817 ;
                    13: ARR = 50617 ;
                    14: ARR = 47823 ;
                    15: ARR = 42563 ;
                    16: ARR = 37921 ;
                    17: ARR = 35793 ;
                    18: ARR = 31887 ;
                    19: ARR = 28408 ;
                    20: ARR = 25309 ;
                    default: ARR = 191130;
                endcase         
            end
endmodule


