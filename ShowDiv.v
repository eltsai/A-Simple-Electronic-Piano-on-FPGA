`timescale 1ns / 1ps
module ShowDiv(                           //50MHz至2Hz降频
    input clk,                        //50MHz计时器
    input rst_n,                      //开始
    output reg cnt_en                 //计数信号
    );
	 
 	 reg [24:0] cnt_div;               //50MHz计时器

always@(posedge clk or negedge rst_n) //clk上升沿有效，rst_n下降沿有效
     begin
         if(~rst_n)
             cnt_div <= 25'h0;
         else if(cnt_div == 25'd24_999_999)
             cnt_div <= 25'h0;
        else
            cnt_div <= cnt_div + 25'h1;
    end

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
             cnt_en <= 1'b0;
         else if(cnt_div == 25'd24_999_999)
             cnt_en <= 1'b1;
        else
            cnt_en <= 1'b0;
    end

endmodule
