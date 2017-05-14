`timescale 1ns / 1ps
module OdeAnDieFreude(
    input beat,
	 input [1:0] func,
    input clk_5m,
    output reg [3:0] med_ma = 4'b000,
    output reg[3:0] low_ma = 4'b000,
	 output reg [3:0] med_ch = 4'b000,
    output reg[3:0] low_ch = 4'b000
    );

reg [9:0] cnt;

always@(posedge beat )
begin
	 begin
	     if(cnt == 63 )
		      cnt <= 0;
			else
			cnt <= cnt + 1;
			case(cnt)
			0:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;    //第一句
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
         1:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
         2:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end	
			3:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			
			4:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end			
			5:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			6:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0111;
			end			
			7:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0110;
			end
			
			8:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			9:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0110;
			end
			10:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0000_0111;
			end
			11:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			
			
			12:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			13:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			14:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0100_0000;
			end
			15:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			
			16:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			17:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			18:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			19:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			
			20:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0100_0000;
			end
			21:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			22:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			23:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			
			
			24:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			25:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			26:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			27:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			
			28:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			29:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			30:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0110;
			end
			31:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0111;
			end
			
			
			32:                                        //第二句
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			33:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			34:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			35:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			
			36:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			37:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			38:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0111;
			end
			39:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0110;
			end
			
			40:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			41:
			begin
			    {med_ma,low_ma} <= 8'b0101_0000;  
				 {med_ch,low_ch} <= 8'b0000_0110;
			end
			42:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0000_0111;
			end
			43:
			begin
			    {med_ma,low_ma} <= 8'b0100_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			44:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			45:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			46:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0100_0000;
			end
			47:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			
			48:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			49:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			50:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			51:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			
			52:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0100_0000;
			end
			53:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0011_0000;
			end
			54:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0010_0000;
			end
			55:
			begin
			    {med_ma,low_ma} <= 8'b0011_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			
			56:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			57:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			58:
			begin
			    {med_ma,low_ma} <= 8'b0010_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			59:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0000_0101;
			end
			
			60:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			61:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			62:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			63:
			begin
			    {med_ma,low_ma} <= 8'b0001_0000;  
				 {med_ch,low_ch} <= 8'b0001_0000;
			end
			endcase
	 end
end

endmodule
