module shift_regist(Q,D,rst,clk);
	output [7:0]Q;
	input D,rst,clk;
	reg [7:0]Q;
	always @(posedge clk) 
	begin
	if (!rst) 
		Q<=8'b00000000;
	else      
		Q<={Q[6:0],D};
	end
endmodule
