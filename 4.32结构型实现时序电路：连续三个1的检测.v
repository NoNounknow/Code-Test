module checker(x,z,clk);//结构性描述
	output z;
	input x,clk;
	wire w1,w2;//w1=q0^n+1 w2=q1^n+1
	reg z;
	dff	U1(.d(x),.clk(clk),.q(w1));
	dff	U2(.d(w1),.clk(clk),.q(w2));
	//and	U3(z,w1,w2,x);
	//也可采用以下写法
	assign  z=w1 & w2 & x ;
endmodule

module dff(d,clk,q);//d触发器的函数模块。
	output	q;
	input	d,clk;
	reg	q;
	always @(posedge clk) 
	begin
		q <= d;
	end
endmodule