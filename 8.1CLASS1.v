module led_test(a,b,key_in,led_out);//模块名与顶层一致
	input a,b;
	input key_in;
	output led_out;
		always @(a,b,key_in)
			begin
				if (!key_in) 
					begin
						led_out = a;
					end
				else 
					begin
						led_out = b;
					end
			end
endmodule

module led_test(a,b,key_in,led_out);//模块名与顶层一致
	input a,b;
	input key_in;
	output led_out;
	assign led_out=(key_in)?a:b;//key_in = 0 led_out = a
endmodule

`timescale 1ns/1ps
module led_tb;
//激励信号定义
	reg a,b,key_in;
//检测信号定义
	wire led_out;
//模块实例化
	led_test U1(.a(a),.b(b),.key_in(key_in),.led_out(led_out));

		initial
		begin
				a = 0;b= 0;key_in = 0;
			#5	a = 0;b= 0;key_in = 1;
			#5	a = 0;b= 1;key_in = 0;
			#5	a = 0;b= 1;key_in = 1;
			#5	a = 1;b= 0;key_in = 0;
			#5	a = 1;b= 0;key_in = 1
			#5	a = 1;b= 1;key_in = 0;
			#5	a = 1;b= 1;key_in = 1;
			#200 $finish;
		end
endmodule


