module and_2(a,b,c);
	input a,b;
	output c;
		assign c =a & b ;
endmodule

module logic(in1,in2,q); //顶层模块
	input in1,in2;
	output q;
		and_2 U1(in1,in2,q); //此处没有写参数列表。
endmodule
//U1 实例名每当我们调用模块，就需要给他定义一个实例名，一般使用U+数字。