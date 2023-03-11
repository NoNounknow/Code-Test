module counter(count,clk,reset);
	input clk,reset;
	output count;
	reg [7:0]count;
	reg out;
	always @(posedge clk)
		
		if (!reset) 
			count <= 0;
		else if(count =8'b11111111);
			count <= 0;
		else 
			count <= count + 1;
endmodule
