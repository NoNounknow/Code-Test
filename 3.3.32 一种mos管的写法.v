module aNMOS(din,ctr,out);
	input din,ctr;
	output out;
		nmos u1(out,din,ctr);
endmodule