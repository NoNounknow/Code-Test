module	sign_1(out,d,clk,load);//移位寄存器实现的方式
//最快的方式，但是需要六个寄存器，一个位宽一个寄存器太奢侈了
//通过面积换取了速度
	parameter m=6;
	output	out;
	input	clk,load;
	input	[m-1:0]d;
	reg	[m-1:0]q;
		initial	q = 6'b100111;
		always @(posedge clk)
			if (load)
				q <= d;
			else
				q <= {q[m-2:0],q[m-1:0]};
	assign  out=q[m-1] ;
endmodule

module sign_2(out,d,clk,load);
//这种方式是通过把原有的M序列码拆分成n或n+一组，
//直到取出M个状态，再通过状态列出状态转移表以获得反馈的逻辑代数表达式
//特点是不需要通过initial赋予初始值，以及需要存储的数据只有原数据的一部分
//通过反馈电路译码
//只存储了当前的状态，减少了寄存器的使用，
//反馈电路出现错误的时候难以自愈合。
	parameter m=4;
	output	out;
	input	clk,load;
	input	[m-1:0]d;
	wire w1;
	reg	[m-1:0]q;
		always @(posedge clk)
			if (load)
				q <= d;
			else
				q <= {q[m-2:0],w1};
	assign  w1=(~q[2])|(~q[1])|(~q[0]);//反馈
	assign  out = q[m-1] ；
endmodule

module sign_3(out,d,clk,rst);
//同样是列表做成逻辑代数表达式的形式。
//通过计数器译码，通过case语句也可以，但是会臃肿。
//这种设计方式组合电路方式错误不会带到下一轮状态，不传播误差
//具有自愈合特性，可靠性高
	parameter m=4;
	output	out;
	input	clk,rst;
	input	[m-1:0]d;
	reg	[m-1:0]count;
		always @(posedge clk) 
			if (!rst)
				count <= 3'b000;
			else if (count==3'b101) 
				count <= 3'b000;
			else 
				count <= count +1;
	assign out = (count[2])|(count[1]&count[0])|((~count[1])&(~count[0]))
endmodule

