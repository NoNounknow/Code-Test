function [3:0] out1;
	input [7:0]x;//输入数据是一个8位的数值，最多8个0；
	reg[3:0]count;//中间变量
	integer i;
	begin
		count = 0;
		for(i = 0;i<=7;i=i+1)//按位检测输出信号
			if (x[i]==1'b0)
				count = count + 1;
			out1=count //此处会将count的结果返回给out
	end
endfunction