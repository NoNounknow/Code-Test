module para1(C,D);
	parameter a=1;
	parameter b=1;
endmodule

module para2;

	para1 #(4,3) U1(C1,D1);
	para1 #(.b(6),.a(5)) U2(C2,D2);

endmodule
