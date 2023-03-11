module mux4_1(out,data,sel);
	input [1:0]sel;
	input [3:0]data;
	output out;
	wire w1,w2,w3,w4;
	assign  w1=(~sel[1]）&（~sel[0]）&data[0];//~A&~B=DATE[0]
	assign  w2=(~sel[1]）&   sel[0]  &data[1];
	assign  w3=  sel[1]  &（~sel[0]）&data[2];
	assign  w4=  sel[1]  &   sel[0]  &data[3];
	assign  out= w1|w2|w3|w4;
endmodule