module dff_reg(data_q,clk,rst_n);
	output	data_q;
	input	clk,rst_n;
	reg data_q;
	wire w1,w2,w3;
		always @(posedge clk) 
			dff U1(.d(data_q),.clk(clk),rst(rst_n),q(w1));
			dff U2(.d(w1),.clk(clk),rst(rst_n),q(w2));
			dff U3(.d(w2),.clk(clk),rst(rst_n),q(w3));
			dff U4(.d(w3),.clk(clk),rst(rst_n),q(data_q));

endmodule


module dff(q,d,clk,rst);
	output q;
	input d,clk,rst;
	reg q;
		always @(posedge clk ) 
			if (rst) 
				q <= 0;
			else
				q <= d;
endmodule