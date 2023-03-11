module	traffic_lights(red,amber,green);//此程序仅是测试仿真
	output	red,amber,green;
	reg	[1:0]order;
	reg	clk,red,amber,green;
	parameter on=1,off=0,red_tics=350,amber_tics=30,green_tics=200;

	always 
		begin
			#100 clk = 0;
			#100 clk = 1;
			//#100 clk = ~clk;	//时钟周期为200的clk信号。
		end

	task light;
	output red;
	output amber;
	output green;
	input	tics_time;//中间变量。
	input	[1:0]order;
		begin
			red = off;//首先关掉所有的灯。
			amber = off;
			green = off;
			case(order)
				2'b01:red = on;
				2'b10:amber = on;
				2'b11:green = on;
				default:{red,amber,green}={on,on,on};
			endcase
			repeat(tics_time)@(posedge clk);//repeat tics_tim次数的clk上升沿。
			//等到相应数值tics的repeat结束以后，把灯关闭。
			red = off;
			amber = off;
			green = off;
		end
	endtask

	initial	
		begin
			order = 2'b00;
			light (red,amber,green,0.order);//第一次调用任务，完成初始化
		end

	always//通过调用任务产生相应的激励信号。
		begin
			light (red,amber,green,red_tics,order);
			order = 2'b01;
			light (red,amber,green,amber_tics,order);
			order = 2'b10;
			light (red,amber,green,green_tics,order);
			order = 2'b11;
		end
endmodule