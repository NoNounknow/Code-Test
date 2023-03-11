module counter(
                clk_50M,
                rst_n,
                led
                    );
  
        input                      clk_50M;
        input                      rst_n;
        output                     led;
        reg         [24:0]         counter_true;
        parameter                  counter_max = 25_000_000;

        always @(posedge clk_50M or negedge rst_n) 
            if (!rst_n) 
                begin
                    counter_true <= 25'b0;
                end
            else if(counter_true >= counter_max-1'b1)
                begin
                    counter_true <= 25'b0;
                end
            else
                begin
                    counter_true <= counter_true + 1'b1;
                end

        always @(posedge clk or negedge rst) 
        begin
            if (!rst) 
                led <= 1'b1;//LED低电平有效  
            else if(counter_true >= counter_max - 1)
                led <= 1'b1;
            else
                led <= led;
        end
endmodule

`timescale 1ns/1ns
`define clk_period 20
module counter_testbench;
        reg         clk_50M;
        reg         rst_n;

        wire        led;

        counter counter_inst0(
                                .clk_50M(clk_50M),
                                .rst_n(rst_n),
                                .led(led)
                             );
        initial clk = 1;
        always
        #(`clk_period/2)   clk_50M = ~ clk_50M;//`表示调用了一个宏定义参数

        initial
            begin
                rst_n = 1'b0;//复位状态
                #(`clk_period*200); 
                rst_n = 1'b1;
                #(`clk_period*100_000_000)//两秒
                $stop;
            end

endmodule

