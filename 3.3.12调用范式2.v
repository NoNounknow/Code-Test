module andout_1(andout,ina,inb);
	input ina,inb;
	output andout;
	assign andout=ina&inb;//定义与门，默认位宽是一比特。
endmodule

module ex_arrey(out,a,b);
	input [15:0] a,b;
	output [15:0] out;
	wire [15:0] out;//十六位信号。
	andout_1 U1[15:0] (out,a,b);//此处需要定义十六个并行的与门，所以直接调用了十六个一比特的与门。
endmodule