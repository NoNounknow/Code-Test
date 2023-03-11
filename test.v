module	sign(out,clk,load,d);
	parameter	M=6;
	output	out;
	input	load,clk;
	input	[M-1:0]d;
		reg [3:0]q;
		always @(posedge clk)
			if (load) 
				q <= d;
			else
				q <= {q[M-2:0],f}
		assign  f= ;