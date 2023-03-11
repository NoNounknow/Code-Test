`timescale 1ns/1ns
module signl_tb;
	parameter wide = 4,rep=2;
	reg [wide-1:0]out;
	initial
		begin
			out = 0//初始化
				repeat(rep)
					begin
						#wide out=1;
					end
		end
endmodule


