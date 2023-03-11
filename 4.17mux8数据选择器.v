module mux8(data_in,sel,out);
	input [7:0]data_in;
	input [2:0]sel;
	output out;
	wire [3:0]w1;
	wire [1:0]w2;
	assign  w1=sel[0]?{data_in[7],data_in[5],data_in[3],data_in[1]} 
				:{data_in[6],data_in[4],data_in[2],data_in[0]};
	assign  w2=sel[1]?{w1[3],w1[1]}:{w1[2],w1[0]} ;
	assign  out=sel[2]?w2[1]:w2[0] ;
endmodule

module mux8(data_in,sel,out);
	input [7:0]data_in;
	input [2:0]sel;
	output out;
	reg	out;
	always @(data_in or sel) 
	begin
		case(sel)
			3'b000:out=data_in[0];
			3'b001:out=data_in[1];
			3'b010:out=data_in[2];
			3'b011:out=data_in[3];
			3'b100:out=data_in[4];
			3'b101:out=data_in[5];
			3'b110:out=data_in[6];
			3'b111:out=data_in[7];
		endcase
endmodule
