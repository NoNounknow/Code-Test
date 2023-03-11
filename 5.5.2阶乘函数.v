module tryfact_tb;//阶乘函数
	function [31:0]factorial;
		input [3:0]operand;
		reg [3:0]index;
			begin
				factorial = 1;
				for(index=1;index<=operand;index=index+1)
					factorial = index * factorial;
			end
	endfunction

	reg[31:0]result;//输出
	reg[3:0]n;
		initial
			begin
				result=1；
				for(n=1;n<=9;n=n+1)
					begin
						result = factorial(n);
							$display("n=%d result=%d",n,result);

					end
			end
endmodule