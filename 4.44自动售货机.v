//状态有八种，分别是投入的1-7毛钱，超过七角则出报纸，并且启动找零程序。
//状态共八种，设置3位编码。
//输入：0，0.1，0.2，0.5，1，共有五种可能性，采用三位编码。
module	auto_sell(data_in,data_out_1,data_out_2,data_out_3,rst,clk);
//1:出一份报纸 2：找一毛钱 3：找两毛钱，三种输出模式
//该自动售货机设置为最多找零0.3元的特殊模式
	parameter	data_in_width=3,state_width = 3;
	output	data_out_1,data_out_2,data_out_3;
	input	[data_in_width-1:0]data_in;
	input	rst,clk;
	reg	data_out_1,data_out_2,data_out_3;
	reg	[state_width-1:0] state,next_state;
		always @(data_in,state) 
			case(state)
			3'b000:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b001;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b010;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b101;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b100:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b1;
					end
				endcase

			3'b001:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b001;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b010;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b011;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b110;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
				endcase

			3'b010:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b010;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b011;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b100;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b111;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
				endcase

			3'b011:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b011;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b100;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b101;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
				endcase

			3'b100:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b100;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b101;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b110;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b1;
						data_out_3 <= 1'b0;
					end
				endcase

			3'b101:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b101;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b110;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b111;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b011:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b1;
					end
				endcase

			3'b110:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b110;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b111;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b010:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
				endcase

			3'b111:
				case(data_in)
					3'b000:
					begin
						next_state <= 3'b111;
						data_out_1 <= 1'b0;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
					3'b001:
					begin
						next_state <= 3'b000;
						data_out_1 <= 1'b1;
						data_out_2 <= 1'b0;
						data_out_3 <= 1'b0;
					end
				endcase
			endcase
				always @(posedge clk or posedge rst)
					if (!rst) 
						state <= 3'b000;
					else
						state <= next_state;
endmodule



