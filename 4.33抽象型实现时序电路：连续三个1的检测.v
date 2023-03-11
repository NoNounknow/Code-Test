module	checker(x,z,clk);//通过移存的规则实现。
	output	z;
	input	x,clk;
	reg	[2:0]q;
		always @(posedge clk) 
			q <= {q[1:0],x};//利用装入数据从右到左的特性。
		always @(posedge clk) 
			if (q==3'b111) 
				begin
					z = 1;
				end
			else 
				begin
					z = 0;	
				end
endmodule
