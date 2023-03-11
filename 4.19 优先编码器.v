module mux8to3(data_in,sel,y_out,ys,yex);
	output	[2:0]y_out;
	output	ys,yex;
	input	[7:0]data_in;
	input	sel;
	reg	[2:0] y_out;
	reg	ys,yex;
	always @(data_in or sel)
		if(sel) 
			{data_in,ys,yex} = {3'b111,1'b1,1'b1}; //当s端=0的时候电路处于正常工作状态。
		else 
			begin
				casex(data_in) //casex是允许识别X未确认状态的case语句
				8'b0???????:{data_in,ys,yex} = {3'b000,1'b1,1'b0};//问号操作符无视01
				8'b10??????:{data_in,ys,yex} = {3'b001,1'b1,1'b0}; 
				8'b110?????:{data_in,ys,yex} = {3'b010,1'b1,1'b0}; 
				8'b11110???:{data_in,ys,yex} = {3'b011,1'b1,1'b0}; 
				8'b111110??:{data_in,ys,yex} = {3'b100,1'b1,1'b0}; 
				8'b1111110?:{data_in,ys,yex} = {3'b101,1'b1,1'b0}; 
				8'b11111110:{data_in,ys,yex} = {3'b110,1'b1,1'b0}; 
				8'b11111111:{data_in,ys,yex} = {3'b111,1'b0,1'b1}; //相对完整不需要default
				//yex,ys的改变是用来区分与非正常工作状态的不同
				endcase
			end
endmodule
