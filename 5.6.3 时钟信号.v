//时钟
module	clk1(clk);
	output clk;
	parameter clk_period = 10;
	reg clk;
		initial
		begin
			clk = 0;
		forever
			# clk_period clk = ~clk;
		end
endmodule

module clk2(clk);
	output clk;
	parameter clk_period = 10;
	reg clk;
		initial
			clk = 0;
		always//always 没有敏感事件表就会一直执行，等同于initial+forever。		
			#clk_period clk = ~clk;
endmodule

module clk3(clk);
	output clk;
	reg clk;
	parameter high_clk=5,low_clk=20;
		always
			clk = 1;
			#high_clk;
			clk = 0;
			#low_clk;
endmodule

module clk4(clk_a,clk_b);
	output clk_a,clk_b;
	reg	clk_a,clk_b;
	parameter high_clk=5,low_clk=5,pshift_time=2;
		always
			begin
				clk_a = 1;
			#high_clk;
				clk_a = 0;
			#low_clk
			end
		assign  #pshift_time clk_b=clk_a ;
endmodule