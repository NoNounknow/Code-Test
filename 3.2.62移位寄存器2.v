module shift2(d,q,clk,rst);
	output [7:0]q;
	input d,clk,rst;
	reg [7:0]q;
	always @(posedge clk)
		if(!rst)
			q=8'b00000000;
		else 
			begin
				for(i=7,i>0,i=i-1)
					q[i]<=q[i-1];
					q[0]<=d;
			end
endmodule