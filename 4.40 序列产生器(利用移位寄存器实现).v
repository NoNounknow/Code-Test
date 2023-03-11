module signal_100111(out,load,clk,d);
	parameter	M = 6;
	output	out;
	input	load,clk;
	input	[M-1:0] d;
	reg	[M-1:0] q;   //利用Q作为一个序列的纪录变量
		initial	q = 6'b100111;
		always @(posedge clk) 
			if(load)
				q <= d;//load有效的时候，序列脉冲重新搭载？
			else 
				q <= {q[M-2:0],q[M-1:0]};
		assign  out = q[M-1] ;
endmodule 

module  signal_maker1(out,clk, load, D);
	parameter M=6;
	output out;
	input clk,load;
	input [M-1:0] D;
	reg [M-1:0] Q;
		initial Q=6'b100111;
		always @(posedge clk)
			if(load) 
				Q<=D;
			else 
				Q<={Q[M-2:0],Q[M-1]};
		assign out=Q[M];
endmodule

