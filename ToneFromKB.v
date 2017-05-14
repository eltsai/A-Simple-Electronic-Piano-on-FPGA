`timescale 1ns / 1ps
module ToneFromKB_main(
	input clk,
	input rst_n,
	input [7:0]data,
	output reg [3:0] med_ma,
	output reg [3:0] low_ma
	);
	
reg [7:0] hold;

always @ (posedge clk or negedge rst_n) 
begin
	 if(~rst_n)
	 begin
		 {med_ma,low_ma} <= 8'h0;
	 end
    else begin
	 case (data)   
       //°ëÒô£º
		 
       8'h2c: 
		 begin
		 {med_ma,low_ma} <= 8'h08;  //T
		 hold <= {med_ma,low_ma};
		 end
       8'h43: 
		 begin
		 {med_ma,low_ma} <= 8'h09;  //I
       hold <= {med_ma,low_ma};
		 end
		 8'h44: 
		 begin
		 {med_ma,low_ma} <= 8'h0A;  //O
       hold <= {med_ma,low_ma};
		 end
		 8'h54: 
		 begin
		 {med_ma,low_ma} <= 8'h0B;  //[
		 hold <= {med_ma,low_ma};
		 end
		 8'h5D: 
		 begin
		 {med_ma,low_ma} <= 8'h0C;  //\
		 hold <= {med_ma,low_ma};
		 end
		 8'h66: 
		 begin
		 {med_ma,low_ma} <= 8'h0D;  //BKSP
       hold <= {med_ma,low_ma};
		 end
		 
		 
	    //ÓÒÊÖ£º
       8'h58: 
		 begin
		 {med_ma,low_ma} <= 8'h01;  //CAPS
       hold <= {med_ma,low_ma};
		 end
		 8'h1c: 
		 begin
		 {med_ma,low_ma} <= 8'h02;   //A
       hold <= {med_ma,low_ma};
		 end
		 8'h1b:
		 begin
		 {med_ma,low_ma} <= 8'h03;   //S
       hold <= {med_ma,low_ma};
		 end
		 8'h23: 
		 begin
		 {med_ma,low_ma} <= 8'h04;   //D
       hold <= {med_ma,low_ma};
		 end
		 8'h2b: 
		 begin
		 {med_ma,low_ma} <= 8'h05;   //F
       hold <= {med_ma,low_ma};
		 end
		 8'h34: 
		 begin
		 {med_ma,low_ma} <= 8'h06;   //G
       hold <= {med_ma,low_ma};
		 end
		 8'h33: 
		 begin
		 {med_ma,low_ma} <= 8'h07;   //H
       hold <= {med_ma,low_ma};
		 end
		 8'h3b: 
		 begin
		 {med_ma,low_ma} <= 8'h10;   //J
       hold <= {med_ma,low_ma};
		 end
		 8'h42: 
		 begin
		 {med_ma,low_ma} <= 8'h20;   //K
       hold <= {med_ma,low_ma};
		 end
		 8'h4b: 
		 begin
		 {med_ma,low_ma} <= 8'h30;   //L
		 hold <= {med_ma,low_ma};
		 end
		 8'h4c: 
		 begin
		 {med_ma,low_ma} <= 8'h40;   //;
		 hold <= {med_ma,low_ma};
		 end
		 8'h52: 
		 begin
		 {med_ma,low_ma} <= 8'h50;   //'
       hold <= {med_ma,low_ma};
		 end
		 8'h5a: 
		 begin
		 {med_ma,low_ma} <= 8'h60;   //ENTER
		 hold <= {med_ma,low_ma};
		 end
		 8'h71: 
		 begin
		 {med_ma,low_ma} <= 8'h70;   //DELETE
		 hold <= {med_ma,low_ma};
		 end
		 8'h69: 
		 begin
		 {med_ma,low_ma} <= 8'h80;   //END
       hold <= {med_ma,low_ma};
		 end
		 8'h7A: 
		 begin
		 {med_ma,low_ma} <= 8'h90;   //PG DOWN
		 hold <= {med_ma,low_ma};
		 end
		 8'h6C: 
		 begin
		 {med_ma,low_ma} <= 8'hA0;   //KP7
		 hold <= {med_ma,low_ma};
		 end
		 
       //×óÊÖ£º
       8'h12: {med_ma,low_ma} <= hold; 
       8'h1a: {med_ma,low_ma} <= hold;
       8'h22: {med_ma,low_ma} <= hold;
       8'h21: {med_ma,low_ma} <= hold;
       8'h2a: {med_ma,low_ma} <= hold;
       8'h32: {med_ma,low_ma} <= hold;
       8'h31: {med_ma,low_ma} <= hold;
		
       8'h29:
		 begin
		 {med_ma,low_ma} <= 8'h00;   //SPACE
       hold <= 8'h00;
		 end

       default: 
		 begin
		 {med_ma,low_ma} <= 8'h00;
		 end
		 endcase
		 end
end
endmodule
