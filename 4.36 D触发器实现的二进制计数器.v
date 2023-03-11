module	dff_comp2bit(q,clk,rst);
	output	q;
	input	clk,rst;
	reg	q;
		always @(posedge clk or posedge rst) 
			if(rst)
				q = 1'b0;
			else 
				q = ~q; //此处因为没有接入输入信号所以不需要额外声明一个d
				//此处统计的是时钟信号的数目。
endmodule
		