//从128个8bits的mem中读出数字凑成32bits的address输出。
module demo_task_invo_tb;
	reg [7:0]mem[127:0];
	reg [15:0]a;
	reg [31:0]b;
		initial
		begin
			a = 0;
			read_memory(a,b);
		#10;
			a = 64;
			read_memory(a,b);
		end
task read_memory;
	input [15:0]address;
	output [31:0]data;
	reg [3:0]counter;
	reg [7:0]temp[1:4];//深度为4的8bits数
		begin
			for(counter = 1;counter <= 4;counter = counter + 1)
				temp[counter]=mem[address+counter-1];//每四个temp被装入四个mem地址
				data = {temp[1],temp[2],temp[3],temp[4]};//将这四个task拼成一个32位的数
		end
endtask
endmodule