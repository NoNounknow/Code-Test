//单次计数指的是cnt_stary的单次周期内只进行一次计数，也就是计数一个周期，是这种模式
//而循环计数指的是只要一次使能便一直计数直到使能停止
module beep_test
(
	clk,rst,
	cnt_acc,//定时预设值
	mode,//模式切换，mode为1的时候循环定时，mode为0单次定时
	cnt_start,//启动信号,高电平启动低电平停止(使能信号)
	count_now,//输出计数数值
	full_r,//通知信号,当计数满的时候=1
			);
		input clk,rst;
		input [31:0]cnt_acc;
		input mode,cnt_start;
		output [31:0]count_now;
		output full_r;
		reg full_r;
		reg oneshot;//单次定时的内部使能信号
		reg [31:0]count;	
		wire full;
		assign count_now = count; 
		assign full =(count == cnt_acc-1)?1:0;//这里如果是>=的话会多记一个时钟周期的高电平
										
				always @(posedge clk)
							full_r <= full;
							
				always @(posedge clk or negedge rst)
					if(!rst)
						count <=0;
					else if(mode == 1)//循环计数模式
							begin
								if ((cnt_start) && (!full))
									 count <= count+1'b1;
								else
									 count <= 1'b0;
							end
					else if (!mode) //单次计数模式
						begin
							if (oneshot)
								count <= count +1'b1;
							else
								count <= 0;
						end
					else
						count <= count;
				
				always @(posedge clk or negedge rst)//oneshot的产生
						if(!rst)
							oneshot <= 1'b0;
						else if(!mode)
								begin
									if(cnt_start)
										oneshot <= 1'b1;
									else if(full)
										oneshot <= 1'b0;
									else
										oneshot <= oneshot;
								end
						else
								oneshot <= 1'b0;		

						
endmodule



