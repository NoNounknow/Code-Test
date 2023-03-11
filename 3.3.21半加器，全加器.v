module halfadder(a,b,s,c);
	input a,b;
	output s,c;
	assign s = a^b ;
	assign c = a&b ;
endmodule

module fulladder(p,q,ci,sum,co);
	input p,q,ci ;
	output sum,co ;
		wire w1,w2,w3 ;
		halfadder U1(p,q,w1,w2) ;
		halfadder U2(w1,ci,sum,w3) ;
		or U3(co,w2,w3) ;
endmodule
