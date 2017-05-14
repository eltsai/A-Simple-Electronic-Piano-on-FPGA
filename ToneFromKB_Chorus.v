`timescale 1ns / 1ps

module ToneFromKB_Chorus(
	input clk,
	input rst_n,
	input [7:0]data,
	output reg [3:0] med_ch,
	output reg [3:0] low_ch
    );
reg [7:0] hold;

always @ (posedge clk or negedge rst_n) 
begin
	 if(~rst_n)
	 begin
		 {med_ch,low_ch} <= 8'h0;
	 end
    else begin
	 case (data)   
       //°ëÒô£º
		 
       8'h2c: {med_ch,low_ch} <= hold;
       8'h43: {med_ch,low_ch} <= hold;
       8'h44: {med_ch,low_ch} <= hold;
       8'h58: {med_ch,low_ch} <= hold;
		 8'h5D: {med_ch,low_ch} <= hold;
		 8'h70: {med_ch,low_ch} <= hold;
     
	    //ÓÒÊÖ£º
           
       8'h1c: {med_ch,low_ch} <= hold;
       8'h1b: {med_ch,low_ch} <= hold;
       8'h23: {med_ch,low_ch} <= hold;
       8'h2b: {med_ch,low_ch} <= hold;
       8'h34: {med_ch,low_ch} <= hold;
       8'h33: {med_ch,low_ch} <= hold;
       8'h3b: {med_ch,low_ch} <= hold;
       8'h42: {med_ch,low_ch} <= hold;
       8'h4b: {med_ch,low_ch} <= hold;
		 8'h4c: {med_ch,low_ch} <= hold;
		 8'h52: {med_ch,low_ch} <= hold;
       8'h5a: {med_ch,low_ch} <= hold;
		 8'h71: {med_ch,low_ch} <= hold;
		 8'h69: {med_ch,low_ch} <= hold;
       8'h7A: {med_ch,low_ch} <= hold;
		 8'h6C: {med_ch,low_ch} <= hold;
		 
		 
       //×óÊÖ£º
       8'h12: 
		 begin
		 {med_ch,low_ch} <= 8'h01;    //L SHFT
       hold <= {med_ch,low_ch};
		 end
		 8'h1a: 
		 begin
		 {med_ch,low_ch} <= 8'h02;   //Z
		 hold <= {med_ch,low_ch};
		 end
       8'h22: 
		 begin
		 {med_ch,low_ch} <= 8'h03;   //X
       hold <= {med_ch,low_ch};
		 end
		 8'h21: 
		 begin
		 {med_ch,low_ch} <= 8'h04;   //C
       hold <= {med_ch,low_ch};
		 end
		 8'h2a: 
		 begin
		 {med_ch,low_ch} <= 8'h05;   //V
       hold <= {med_ch,low_ch};
		 end
		 8'h32: 
		 begin
		 {med_ch,low_ch} <= 8'h06;   //B
       hold <= {med_ch,low_ch};
		 end
		 8'h31: 
		 begin
		 {med_ch,low_ch} <= 8'h07;   //N
       hold <= {med_ch,low_ch};
		 end
		 
		 8'h29:
		 begin
		 {med_ch,low_ch} <= 8'h00;   //SPACE
       hold <= 8'h00;
		 end
		 
       default: 
		 begin
		 {med_ch,low_ch} <= 8'h00;
		 end
		 endcase
		 end
end

endmodule
