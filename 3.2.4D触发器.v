module assign_dff(d,clr,clk,q);
	input d,clr,clk;
	output q;
	reg q;
	always @(clr) 
		begin
		if(!clr)
			assign  q=0 ; //时钟沿来临时，赋值q=0,即d对q无效;
		else
			deassign q ;
		end
	always @(negedge clk)
			q=d;
endmodule