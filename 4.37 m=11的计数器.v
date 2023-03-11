module comp11(count,clk,rst);
	output [3:0]count;
	input	clk,rst;
	reg	[3:0]count;
		always @(posedge clk or posedge rst) 		
			if (rst) 
					count <= 4'b0000;				
				
			else if (count == 4'b1010) //反馈清零，从0开始计数，反馈置位则是N进制-M模值
				
					count <= 4'b0000;			
			else 
				
					count <= count + 1;			
		
endmodule

module comp11(count,clk,rst);//置数是从指定的数值往回减少
	output [3:0]count;
	input	clk,rst;
	reg	[3:0]count;
		always @(posedge clk or posedge rst) 		
			if (rst) 
					count <= 4'b1010;				
				
			else if (count == 4'b0000) //反馈置数
				
					count <= 4'b1010;			
			else 
				
					count <= count - 1;			
		
endmodule

module comp11(count,clk,rst);//置数是从指定的数值往回减少
	output [3:0]count;
	input	clk,rst;
	reg	[3:0]count;
		always @(posedge clk or posedge rst) 		
			if (rst) 
					count <= 4'b0101;				
				
			else if (count == 4'b1111) //反馈置数，加法的情况。
				
					count <= 4'b0101;			
			else 
				
					count <= count + 1;			
		
endmodule

