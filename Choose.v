`timescale 1ns / 1ps
	module Choose(
    input       clk,
    input [1:0] func,

	 input [3:0] med_ma0,
    input [3:0] low_ma0,
    input [3:0] med_ch0,
    input [3:0] low_ch0,
	 input [3:0] low_ma1,
	 input [3:0] med_ma1,
	 input [3:0] med_ma2,
    input [3:0] low_ma2,
    input [3:0] med_ch2,
    input [3:0] low_ch2,
	 input [3:0] med_ma3,
    input [3:0] low_ma3,
    input [3:0] med_ch3,
    input [3:0] low_ch3,

    output reg [3:0] med_ma,
    output reg [3:0] low_ma,
    output reg [3:0] med_ch,
    output reg [3:0] low_ch
    );
	 

 
always@(posedge clk)
if(func == 2'b01)
begin
    med_ma <= med_ma1;
	 low_ma <= low_ma1;
	 med_ch <= 4'b0000;
	 low_ch <= 4'b0000;
end
else if(func == 2'b10)
begin
    med_ma <= med_ma2;
	 low_ma <= low_ma2;
	 med_ch <= med_ch2;
	 low_ch <= low_ch2;
 
end
else if(func == 2'b11)
begin
    med_ma <= med_ma0;
	 low_ma <= low_ma0;
	 med_ch <= med_ch0;
	 low_ch <= low_ch0;
end
else
begin
    med_ma <= med_ma3;
	 low_ma <= low_ma3;
	 med_ch <= med_ch3;
	 low_ch <= low_ch3;
end




endmodule
