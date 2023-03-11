module	check111(x,out,clk);
	parameter	s0 = 2'b00,s1 = 2'b01,s2 = 2'b11,s3 = 2'b10;
	output	out;
	input	clk,x;
	reg	[1:0]state;
	reg	[1:0]next_state;
	reg	out;
		always @(x,state) 
			case(state)
				s0:
				if(x)
					next_state <= s1;
					out <= 0;
				else
					next_state <= s0;
					out <= 0;
				s1:
				if(x)
					next_state <= s2;
					out <= 0;
				else
					next_state <= s0;
					out <= 0;
				s2:
				if(x)
					next_state <= s3;
					out <= 1;
				else
					next_state <= s0;
					out <= 0;
				s3:
				if(x)
					next_state <= s3;
					out <= 1;
				else
					next_state <= s0;
					out <= 0;
			endcase
		always @(posedge clk) 
			state <= next_state;
endmodule

module dff(d,q,clk);
	output q;
	input d,clk;
	reg	q;
	always @(posedge clk)
			q <= d;
endmodule

module check111(x,clk,out);
	output out;
	input	x,clk;
	wire w1,w2;
	reg	out;
		always @(posedge clk)
			dff U1(.d(x),.clk(clk),.q(w1));
			dff U2(.d(w1),.clk(clk),.q(w2));
			and	U3(out,x,w1,w2);
endmodule

module check111(x,clk,out);
	output out;
	input	x,clk;
	reg out;
	reg [2:0]q;
		always @(posedge clk) 
			q <= {q[1:0],x}
		always @(posedge clk)
			if(q == 3'b111)
				out = 1;
			else
				out = 0;
endmodule


$display	("f=%d",f);
$write	("f=%d",f);
$display("\\\t%%\n\"\123");
//内容：\\=\,\t=横向跳格，相当于tab，%%=%，\n=换行,"\=",\123=输出相应的八进制数代表的字符=s




module strobe_tb;
	reg	a,b;
	initial 
	begin
		a = 0;
		$display("a:",a);	//输出a：0
		$strobe ("a:",a);   //输出a：1
		a = 1;
	end
	initial
	begin
		b <= 0;
		$display("b:",b);	//输出b:x
		$strobe ("b:",b);	//输出b:1
		#5；
		b <= 1;
	end

module xxx_tb;
	wire 
	reg 

	dff

	always
		clk = ~clk;
	initial
		begin
			
		end

		xx = 20*($random%6)//产生一个-5到+5的随机数。所以：0~100ns=xx
	
