module decoder2_4(in0,in1,en,out0,out1,out2,out3);
	input in0,in1,en;
	output out0,out1,out2,out3;
	wire w1,w2;
		not U1(w1,in0);
			u2(w2,in1);
		nand U3(out0,w1,w2,en);
			 U4(out1,w1,in1,en);
			 U5(out2,en,in0,w2);
			 U6(out3,en,in0,in1);
endmodule
