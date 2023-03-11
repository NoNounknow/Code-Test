module	decode_2to4(e,data_in,data_out);//写法一
	input e;
	input [1:0]data_in;
	output [3:0]data_out;
	reg	[3:0]data_out;
	always @(data_in or e) 
		if (e) 
			data_out = 4'b0000;
		else 
			begin
				casex(data_in)
				2'b00:	data_out = 0001;
				2'b01:	data_out = 0010;
				2'b10:	data_out = 0100;
				2'b11:	data_out = 1000;
				endcase
			end
endmodule

module	decode_2to4(e,data_in,data_out);//写法二，真值表case语句
	output [3:0]data_out;
	input e;
	input [1:0]data_in;
	reg	[3:0]data_out;
	always @(data_in or e) 
			begin
				casex({e,data_in})		//链接操作符：{}
				3'b1??:	data_out = 0000;
				3'b000:	data_out = 0001;
				3'b001:	data_out = 0010;
				3'b010:	data_out = 0100;
				3'b011:	data_out = 1000;
				default:data_out = 0000;
				endcase
			end
endmodule 

module decode_2to4(e,a,out);//写法三,逻辑代数表达式的形式
	input [1:0]a;
	input	e;
	output [3:0]out;
	assign  out[0]=~(~e&~a[1]&~a[0]);
	assign  out[1]=~(~e&~a[1]&a[0]);
	assign  out[2]=~(~e&a[1]&~a[0]);
	assign  out[3]=~(~e&a[1]&a[0]);
endmodule


