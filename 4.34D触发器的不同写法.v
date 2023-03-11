//触发器
module	dff(d,q,clk);
	output	q;
	input	d,clk;
	reg	q;
		always @(posedge clk) 
			q <= d;
endmodule

module	reset_dff(d,q,clk,rst);
	output	q;
	input	d,clk;
	reg	q;
		always @(posedge clk ) //同步复位，仅当上升沿到来的时候才能够置零。
		if (!rst) 
			begin
				q <= 0;
			end
		else 
			begin
				q <= d;
			end		
endmodule

module	reset_dff(d,q,clk,rst);
	output	q;
	input	d,clk;
	reg	q;
		always @(posedge clk or posedge rst) //异步复位，不需要等待时钟计数。
		begin
			if (!rst) 
				begin
					q <= 0;
				end
			else 
				begin
					q <= d;
				end
		end
endmodule
