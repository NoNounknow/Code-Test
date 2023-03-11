module check(b,fod,fev);//结构型
	output	fod,fev;
	input	[7:0]b;
	wire	[3:0]w1;
	wire	[1:0]w2;
		xor	U1(w1[0],b[0],b[1]);
		xor	U2(w1[1],b[2],b[3]);
		xor	U3(w1[2],b[4],b[5]);
		xor	U4(w1[3],b[6],b[7]);
		xor	U5(w2[0],w1[0],w1[1]);
		xor	U6(w2[1],w1[2],w1[3]);
		xor	U7(fod,w2[0],w2[1]);
		not	U8(fev,fod);
endmodule

module check(b,fod,fev);//数据流
	output	fod,fev;
	input	[7:0]b;
	//assign  fod=b[0]^b[1]^b[2]^b[3]^b[4]^b[5]^b[6]^b[7] ;
	assign  fod = ^b ;//对自身进行异或
	assign  fev = ~fod ;
endmodule
