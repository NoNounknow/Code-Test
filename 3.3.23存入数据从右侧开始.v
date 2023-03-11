module ex1(a,b);
	input [6:1]a;
	ouput [3:0]b;
endmodule

module test(c,d);
	wire [5:3]c;
	wire [5:1]d;
	ex1 U1(.a(c),.b(d));
endmodule