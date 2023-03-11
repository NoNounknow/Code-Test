module	monitor_tb;
	integer	a,b;
		initial
			begin
				a = 2;
				b = 4;
				forever 
					begin
						#5 a = a + b;b = a - 1;
					end
			end
			#40 $finish;
$monitor($time,"a = %d,b = %d",a,b);
endmodule
