module	M(out,a,b,c);
	output out;
	input	a,b,c;
	assign  out=(a&b)|(c&d);
		specify
			(a=>out)=9;
			(b=>out)=9;
			(c=>out)=11;
			(d=>out)=11;
		endspecify
endmodule

parameter
specparam
