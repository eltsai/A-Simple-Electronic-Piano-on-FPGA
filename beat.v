`timescale 1ns / 1ps

module beat(                           //节拍产生模块  
    input rst_n,
    input clk,
    output reg beat
    );
//clk = 50MHz, div into 4Hz
//1 pause/ 12 5000 000 clocks
reg [24:0] cnt = 25'h0;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)                           //关机时
	     cnt <= 25'h0;
	 else if(cnt == 25'd12_499_999)       //开机时
	     cnt <= 25'h0;
	 else 
	     cnt <= cnt + 25'h1;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
	     beat <= 1'b0;
	 else if(cnt == 25'd12_499_999)
	     beat <=1'b1;
	 else
	     beat <= 1'b0;                //每1/4秒一个上升沿
end 

endmodule
