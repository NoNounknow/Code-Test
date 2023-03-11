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

module code_change(b_in,b_out);
	input b_in;
	output b_out;
	bcd8421 U1(.data_in(b_in));
	assign  b_out = b_in +2'b11 ;
endmodule