module sign(out,clk);
	parameter	s0=00,s1=01,s2=10,s3=11;
	output [3:0]out;
	input	clk;
	reg	[3:0]out;
	reg	[1:0] state,next_state;
	always @(state)
			case(state)
				s0:
				begin
				out <= 4'b1000;
				next_state <= s1;	
				end
				out <= 4'b1000;
				next_state <= s1;
				s1:
				begin
				out <= 4'b0100;
				next_state <= s2;
				end
				s2:
				begin
				out <= 4'b0010;
				next_state <= s3;
				end
				s3:
				begin
				out <= 4'b0001;
				next_state <= s0;
				end
			endcase
	always @(posedge clk)
		state <= next_state;
endmodule

/*
module sign(out,clk);
	output [3:0]out;
	reg	[3:0]q;
	reg	[3:0]out;
	initial	q=4'b1000;
		always@(posedge clk)
			q <= {q[0],q[3:1]};
	assign out = q;
endmodule