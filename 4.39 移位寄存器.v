module shiftregist(d,clk,rst);
	parameter	shiftregist_width = 4;
	output	[shiftregist_width-1:0]d;
	input	clk,rst;
	reg [shiftregist_width-1:0]d;
		always @(posedge clk) 
			if (!rst) 
				d <= 4'b0000;
			else 
				d <= {d[shiftregist_width-2:0],d[shiftregist_width-1:0]};
				//环形移位寄存器，将之前信号的最高位移置所谓的d0（最低位置）。
			/*	
				移位操作符写法：
				temp =< d[3];
				d <= d<<1;
				d[0] = temp;
				所以更建议采用链接操作符，一句话可以说清楚
			*/
endmodule