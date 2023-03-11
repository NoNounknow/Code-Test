module    block(
                Rst_n,
                Clk,
                a,
                b,
                c,
                out
                );

    input               Rst_n;
    input               Clk;
    input               a,b,c;
    output reg  [1:0]   out;
    reg         [1:0]   d;
    //d = a + c
    //out = d + c

    always @(posedge Clk or negedge Rst_n)
        if(!Rst_n)
            out = 2'b0;
        else 
            begin
                d = a + b;
                out = d + c ;
            end
endmodule
            
            