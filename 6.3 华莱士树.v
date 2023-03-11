module fulladder(a,b,ci,out1);
	input a,b,ci;
	output [1:0]out1;
		assign  out1=a+b+ci ;
endmodule

module halfadder(a,b,out2);
	input a,b,ci;
	output [1:0]out2;
		assign  out2=a+b;
endmodule

module wallace(int_a,int_b,out);
	parameter size=4;
	input [size-1:0]int_a,int_b;
	output [2*size-1:0]out;
	wire [size*size-1:0]a;
	wire [1:0]b1,b2;
	wire [1:0]c1,c2,c3,c4;
	wire [5:0]add_a;
	wire [6:0]add_b;
		