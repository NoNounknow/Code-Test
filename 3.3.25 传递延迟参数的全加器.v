module halfadder(a,b,s,c);
	input a,b;
	output s,c;
	parameter xor_delay=2,and_delay=3;//设置两个参数的数值。
		assign  #xor_delay s=a^b ;//这两个参数的意义是他们的延迟。
		assign  #and_delay c=a&b ;
endmodule

module fulladder(p,q,ci,co,sum);
	input p,q,ci;
	output co,sum;
	parameter or_delay = 1;
	wire w1,w2,w3;
		halfadder U1(p,q,w1,w2);
		halfadder U2(w1,ci,sum,w3);
		or #or_delay U3(co,w2,w3);
endmodule

module top1(top1a,top1b,top1s,top1c);
	input top1a,top1b;
	output top1s,top1c;
		defparam 
				U1.xor_delay=4;//此处的U1是下列的“实例名”。
				U1.and_delay=5;
		halfadder U1(top1a,top1b,top1s,top1c);
endmodule

module top2(top2p,top2q,top2ci,top2sum,top2co);
	input top2p,top2q,top2ci;
	output top2sum,top2co;
		defparam
				U2.U1.xor_delay=6;
				U2.U2.and_delay=7;
				U2.or_delay    =5;//此处改写的是第14——16行的全加器的参数。
		fulladder U2(top2p,top2q,top2ci,top2sum,top2co);
endmodule


