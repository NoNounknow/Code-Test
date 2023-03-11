module full_4bits_fast(a,b,ci,co,sum);
	input [3:0]a,b;
	input ci;         //ci是低阶进位，此处作为最低阶进位使用
	output [3:0]sum;  //总和数
	output co;		  //高阶进位co
	wire [4:0] g,p,c; //c表示超前进位

	assign  c[0]=ci ; //最低阶的进位就是ci
	assign  p=a^b ;	  //按位异或逻辑数
	assign  g=a&b ;	  //按位与逻辑数
	assign  c[1]=g[0]| (p[0]&(c[0]));
	assign  c[2]=g[1]| (p[1]&(p[0]&(c[0]))) ;
	assign  c[3]=g[2]| (p[2]&(p[1]&(p[0]&(c[0])))) ;
	assign  c[4]=g[3]| (p[3]&(p[2]&(p[1]&(p[0]&(c[0]))))) ;
	assign  sum=p^c[3:0] ;
	assign  co =c[4];
endmodule
