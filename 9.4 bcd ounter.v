module  bcd(
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
        output  reg  [3:0]    q;

        reg         [3:0]    cnt;

        always @(posedge Clk or negedge Rst_n)
          
                if(!Rst_n)
                    cnt <= 4'b0;
                else if(Cin == 1'b1)
                    begin
                        if (cnt == 4'b1001) 
                            begin
                                cnt <= 4'b0;
                            end
                        else
                            cnt <= cnt + 1;      
                    end
                else
                    cnt <= cnt;

        always @(posedge Clk or negedge Rst_n)
          
                if(!Rst_n)
                    Count <= 0;
                else if (cnt == 4'b1001 && Cin == 1'b1)
                    Count <= 1;
                else
                    Count <= Count;

        always @(posedge Clk or negedge Rst_n)
                q <= cnt;

endmodule