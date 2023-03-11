module	counter_demo(clk,cnt);
	output	[3:0]cnt;
	reg	clk;
	reg	[3:0]temp;//中间变量
	initial 
		clk = 0;
	initial
		temp = 0;
endmodule