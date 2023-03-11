module four(f,a,b,c);
	parameter compare_width = 4;
	input [compare_width-1:0]a;//此处的写法是为了改参数方便
	input [compare_width-1:0]b;
	output [3:0]f;//f表示的是输出的结果；
	output [3:0]c;//倘若ab相等，则由c作为控制器来选择谁更大
	reg [3:0]f;
	always @(a or b or c) 
		if(a>b)
			f = 3 'b100;
		else if(a<b)
			f = 3 'b001;
		else
			f = c;
endmodule