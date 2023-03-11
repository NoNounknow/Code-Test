module	fulladder(a,b,ci,sum,co);
	output	sum,co;
	input	a,b,ci;
	assign  {co,sum} = a + b + ci ;
endmodule

module test_fulladder:
	wire	sum,co;
	reg	a,b,ci;
	fulladder U1(.a(a),.b(b),.ci(ci),.sum(sum),.co(co));//模块实例化
		initial
		begin
			a = 0;b = 0; ci = 0;
		#20 a = 0;b = 0; ci = 1;
		#20 a = 0;b = 1; ci = 0;
		#20 a = 0;b = 1; ci = 1;
		#20 a = 1;b = 0; ci = 0;
		#20 a = 1;b = 0; ci = 1;
		#20 a = 1;b = 1; ci = 0;
		#20 a = 1;b = 1; ci = 1;
		#200 $finish;
		end
endmodule
