module	bcd8421(data_in,data_out);
	input data_in;
	output [3:0]data_out;
	reg	[3:0]data_out;
	always @(data_in) 
		begin
			case(data_in)
				1'd0:	data_out = 4'b0000;
				//描述的是10进制数，需要至少四个比特
				1'd1:	data_out = 4'b0001;
				1'd2:	data_out = 4'b0010;
				1'd3:	data_out = 4'b0011;
				1'd4:	data_out = 4'b0100;
				1'd5:	data_out = 4'b0101;
				1'd6:	data_out = 4'b0110;
				1'd7:	data_out = 4'b0111;
				1'd8:	data_out = 4'b1000;
				1'd9:	data_out = 4'b1001;
				default	data_out = 4'b0000;
			endcase
		end
endmodule

module	bcd8421(data_in,data_out);
	input [8:0]data_in;
	output [3:0]data_out;
	reg	[3:0]data_out;
	always @(data_in) 
		begin
			case(data_in)
				9'b000000000:	data_out = 4'b0000;
				//描述的是10进制数，需要至少四个比特
				9'b000000001:	data_out = 4'b0001;
				9'b000000010:	data_out = 4'b0010;
				9'b000000100:	data_out = 4'b0011;
				9'b000001000:	data_out = 4'b0100;
				9'b000010000:	data_out = 4'b0101;
				9'b000100000:	data_out = 4'b0110;
				9'b001000000:	data_out = 4'b0111;
				9'b010000000:	data_out = 4'b1000;
				9'b100000000:	data_out = 4'b1001;
				default	data_out = 4'b0000;
			endcase
		end
endmodule


