module dff(d,clk,clr,q);
	input d,clk,clr;
	output q;
	reg q;
		always @(posedge clk or negedge clr) 
		begin
			if (!clr) 
				q=0;
			else 
				q=d;
		end
endmodule

module shifter_D(din,clock,clear,out);
	input din,clock,clear;
	output [3:0]out;
	dff U1(.d(din)   ,.clr(clear),.clk(clock),q(out[0]));
	dff U2(.d(out[0]),.clr(clear),.clk(clock),q(out[1]));
	dff U2(.d(out[1]),.clr(clear),.clk(clock),q(out[2]));
	dff U2(.d(out[2]),.clr(clear),.clk(clock),q(out[3]));
endmodule