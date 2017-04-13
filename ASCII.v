`timescale 1ns / 1ps
module ToneFromKB(
	input clk,
	input rst_n,
	input [7:0]data,
	output reg [3:0] med_ma,
	output reg [3:0] med_ch,
	output reg [3:0] low_ma,
	output reg [3:0] low_ch
    );
always @ (posedge clk or negedge rst_n) 
begin
	 if(!rst_n)
		 ps2_asci <= 8'h0;
    else begin
	 case (data)                    //键值转换为ASCII码，这里做的比较简单，只处理字母
       8'h58: {med_ma,low_ma} <= 8'h01;    //CAPSLOCK     
       8'h1c: {med_ma,low_ma} <= 8'h02;   //A
       8'h1b: {med_ma,low_ma} <= 8'h03;   //S
       8'h23: {med_ma,low_ma} <= 8'h04;   //D
       8'h2b: {med_ma,low_ma} <= 8'h05;   //F
       8'h34: {med_ma,low_ma} <= 8'h06;   //G
       8'h33: {med_ma,low_ma} <= 8'h07;   //H
       8'h3b: {med_ma,low_ma} <= 8'h10;   //J
       8'h42: {med_ma,low_ma} <= 8'h20;   //K
       8'h4b: {med_ma,low_ma} <= 8'h30;   //L
		 8'h4c: {med_ma,low_ma} <= 8'h40;   //;
		 8'h52: {med_ma,low_ma} <= 8'h50;   //'
       8'h5a: {med_ma,low_ma} <= 8'h60;   //ENTER
		 8'h6b: {med_ma,low_ma} <= 8'h70;   //KP4


       8'h12: {med_ch,low_ch} <= 8'h01;    //L SHFT
       8'h1a: {med_ch,low_ch} <= 8'h02;   //Z
       8'h22: {med_ch,low_ch} <= 8'h03;   //X
       8'h21: {med_ch,low_ch} <= 8'h04;   //C
       8'h2a: {med_ch,low_ch} <= 8'h05;   //V
       8'h32: {med_ch,low_ch} <= 8'h06;   //B
       8'h31: {med_ch,low_ch} <= 8'h07;   //N


       default: 
		 begin
		 {med_ma,low_ma} <= 8'h00;
		 {med_ch,low_ch} <= 8'h00;
		 end
       endcase
		 end
end
endmodule
