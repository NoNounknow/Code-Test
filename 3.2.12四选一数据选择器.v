module mux3x1(out,in1,in2,in3,in4,sel);
output out;
input in1,in2,in3,in4;
input[1:0]sel;
reg out;
always @(in1 or in2 or in3 or in4 or sel)
	case(sel)
	2'b00: out=in1;
	2'b01: out=in2;
	2'b10: out=in3;
	2'b11: out=in4;
	endcase
endmodule