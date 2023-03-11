module mul_addtree(out,inta,intb);
	output [7:0]out;
	input  [3:0]inta,intb;
	wire [7:0]w1,w2,w3,w4;
	wire [7:0]w5,w6;
		assign  w1= intb[0]?{4'b0,inta}:8'b0;
		assign  w2= intb[1]?{3'b0,inta,1'b0}:8'b0;
		assign  w3= intb[2]?{2'b0,inta,2'b0}:8'b0;
		assign  w4= intb[3]?{1'b0,inta,3'b0}:8'b0;
		assign  w5=w1+w2 ;
		assign  w6=w3+w4 ;
		assign  out=w5+w6 ;
endmodule

module mul_addtree2(out,clk,rst,inta,intb);
	output [7:0]out;
	input	clk,rst;
	input  [3:0]inta,intb;
	wire [7:0]w1,w2,w3,w4;
	wire [7:0]w5,w6;
		assign  w1= intb[0]?{4'b0,inta}:8'b0;
		assign  w2= intb[1]?{3'b0,inta,1'b0}:8'b0;
		assign  w3= intb[2]?{2'b0,inta,2'b0}:8'b0;
		assign  w4= intb[3]?{1'b0,inta,3'b0}:8'b0;
			always @(posedge clk) 
				if(rst!)
					begin
					w5  <= 8'b00000000;
					w6  <= 8'b00000000;
					out <= 8'b00000000;
					end
				else
					begin
					w5 <=w1+w2;
					w6 <=w3+w4;
					out <=w5+w6;

endmodule