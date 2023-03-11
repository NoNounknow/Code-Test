module	delay_t(out,a,b,c);
	output	out;
	input	a,b,c;
	reg		out;
	wire	e;
		and	#5 (e,a,b);
		or  #4 (out,e,c);
endmodule

module delay_tb;
	wire out;
	reg a,b,c;

	delay_tb u1(.out(out),.a(a),.b(b),.c(c));

	initial
		begin
		a = 1'b0;b=1'b0,c=1'b0;
		end
endmodule