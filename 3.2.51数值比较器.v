module compare(a,b,out);
	input a,b;
	output [1:0] out;
	reg [1:0]out;
	always @(a,b) 
	begin
		if (a>b) 
			out=2'b00;
		else if(a=b)
			out=2'b01;
		else 
			out=2'b11;
	end
endmodule