`timescale 1ns / 1ps
module SongHz( 
    input clk,
    input rst_n,
    output reg clk_5m
    );
//clk = 50MHz, div into 5MHz
//1 pause/ 10 clocks
reg [4:0] cnt = 5'h0;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)                 //关机时
	     cnt <= 5'h0;
	 else if(cnt == 5'h9)       //开机时：每秒5M个上升沿
	     cnt <= 5'h0;
	 else 
	     cnt <= cnt + 5'h1;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
	     clk_5m <= 1'b0;
	 else if(cnt == 5'h9)
	     clk_5m <=1'b1;
	 else
	     clk_5m <= 1'b0;
end 

endmodule
