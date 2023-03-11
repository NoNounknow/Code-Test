module led_flash(clk,rst,led);
	input clk,rst;
	output [3:0]led;
	reg [3:0]led;
	reg [24:0]count;
	parameter cnt_max=25'd24_999_999;
	always @(posedge clk or negedge rst)
			if(!rst)
				count <= 25'd0;
			else if(count == cnt_max)
				count <= 25'd0;
			else
				count <= count+1'b1;
				
	always @(posedge clk or negedge rst)
			if(!rst)
				led <= 4'b1110;
			else if(count == cnt_max)
			//每2499个上升沿进行一次反转
				led <= {led[2:0],led[3]};
				//led <= led>>1;
				//led <= led<<1;
			else	
				led <= led;//若是数值不足则不改变其数据。
endmodule

`timescale 1ns/1ns//周期为20ns
`define clocl_period 20//预编译
module led_flash_tb;
	reg clk,rst;
	wire [3:0] led;

		led_flash 
/*		#(
			.cnt_max(25'd249)
		)                     */
		U1(.clk(clk),.rst(rst),.led(led));
		initial 
			clk = 1;
		always
			#(`clocl_period/2) clk = ~clk;
			
		initial
		begin
			rst = 0;
			#(`clocl_period*20+1) rst = 1;	
			#(`clocl_period*25000000+1);
			$stop;
		end

endmodule