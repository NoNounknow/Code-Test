module	bcd_top(
				Cin,
	            Clk,
	            Rst_n,
	            Count,
	            q
				);
		input                 Cin;
        input                 Clk;
        input                 Rst_n;
            
        output  reg           Count;
        output  reg  [11:0]   q;
        wire		 [3:0]    q1,q2,q3;
        wire                  count0, count1;


		bcd 	bcd_inst0(
							.Cin(Cin),
				            .Clk(Clk),
				            .Rst_n(Rst_n),
				            .Count(count0),
				            .q(q1)
							);
		bcd 	bcd_inst1(
							.Cin(count0),
				            .Clk(Clk),
				            .Rst_n(Rst_n),
				            .Count(count1),
				            .q(q2)
							);
		bcd 	bcd_inst2(
							.Cin(count1),
				            .Clk(Clk),
				            .Rst_n(Rst_n),
				            .Count(Count),
				            .q(q3)
							);
		assign  q={q3,q2,q1} ;
        
endmodule