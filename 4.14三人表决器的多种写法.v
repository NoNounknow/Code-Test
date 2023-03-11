module desingn(a,b,c,out);//数据流，逻辑代数写法
	input a,b,c;
	output out;
	wire w1,w2,w3;
	assign  w1=a & b ;
	assign  w2=a & c ;
	assign  w3=b & c ;
	assign  out= w1|w2|w3;
endmodule

module desingn(a,b,c,out);//数据流，逻辑代数写法2
	input a,b,c;
	output out;
	assign  out= (a&b)|(a&c)|(b&c);
endmodule

module desingn(a,b,c,out);//结构型写法,此处中间变量不需要额外定义？
	input a,b,c;
	output out;
	and U1(w1,a,b);
		U2(w2,a,c);
		U3(w3,b,c);
	or 	U4(out,w1,w2,w3);
endmodule


