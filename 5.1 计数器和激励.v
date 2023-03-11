module	count_10(clk,rst,x,q,count);
	input	clk,rst,x;
	output	count;
	output	[3:0]q;
	reg	[3:0]q;
		always @(posedge clk or posedge rst) 
			begin
				if (rst) 
					q <= 4'b0000;
				else if(x)
					begin
						if(q < 9)	q = q + 1;
						else  		q = 0;
					end
			end
	assign  count=q[3]&q[0] ;
endmodule

module count_10_tb;
	reg	clk,rst,x;
	wire [3:0]q;
	wire count;

	count_10 U1(clk,rst,x,q,count);//模块实例化
		always
			#50 clk = ~clk;
			initial
				begin
					clk = 0;rst = 0;x = 1;
					#1200 rst=1;//1200个时间单位后清零
					#120  rst=0;//清零持续120个时间单位
					#2000 x  = 0;
					#200  x = 1;
					#20000 $finish;				
				end
endmodule