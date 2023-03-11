//明确输入输出：输入检测数字：x；
//输出结果:z;
//初态:state;
//次态：next_state
module checker(x,z,clk);//暂态和次态不作为输出就只是中间变量 无需声明
	output	z;
	input	x;
	parameter	2'b00=s0,2'b01=s1,2'b11=s2,2'b10=s3;
	reg	[1:0]state,next_state;
	reg	z;
	always @(x,state)	//输入和现态
	/*处采用两段式描述，也就是两个always语句块，
	第一个always语句块用来描述状态转移，
	第二个always语句块用来描述转移条件和转移规律，用时组合逻辑输出结果*/
		case(state)
			s0:if(x)
					begin
					next_state <= s1;
					z=0;//x输入的数据决定次态是什么。
					end
				else
					begin
					next_state <= s0;
					z=0;	
					end
			s1:if(x)
					begin
					next_state <= s2;
					z=0;
					end
				else
					begin
					next_state <= s0;
					z=0;	
					end
			s2:if(x)
					begin
					next_state <= s3;
					z=1;//s2-s3此时电路满足条件输出1 根据状态转移图
					end
				else
					begin
					next_state <= s0;
					z=0;	
					end
			s3:if(x)
					begin
					next_state <= s3;
					z=1;//在s3继续跳动，因为之前的检测结果并不清空
					//倘若采用的是清空的设计，此处应当s3-s1
					end
				else
					begin
					next_state <= s0;
					z=0;	
					end
		endcase
	always @(posedge clk) 
		state <= next_state;
endmodule
