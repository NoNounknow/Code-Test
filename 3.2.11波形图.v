module initial_tb1
	reg A,B,C;
	initial_tb
	begin
		A=0;B=1;C=0;
		#100 A=1;B=0;
		#100 A=0;B=0;
		#100 B=1;
		#100 B=0;C=0;
	end
endmodule
