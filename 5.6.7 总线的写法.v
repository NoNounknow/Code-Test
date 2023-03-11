module	bus_wr_tb;
	reg	clk;
	reg cs;
	reg	wr;
	reg	[31:0]addr;
	reg	[31:0]data;

		initial
			clk = 1;
		always 
			#5 clk =~clk;

		task bus_wr;
			input [31:0]ADDR;
			input [31:0]DATA;
					begin
						cs = 1'b0;wr = 1'b0;
						addr = ADDR;
						data = DATA;
					#30；cs = 1'b1;wr = 1'b1;
					end
		endtask

		initial
			begin
			cs = 1'b1;wr = 1'b1;
			#30；
			bus_wr (32'h1100008a,32'h11113000);
			addr=32'bx;data=32'bx;
			end
endmodule
