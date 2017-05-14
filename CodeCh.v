`timescale 1ns / 1ps

module CodeCh(
	 input       rst_n,
	 input       clk,
	 input [7:0] HI_data,
	 input [7:0] TONE_data,
	 input       beat,
	 output reg [7:0] data
    );
	 
reg [3:0] cnt = 1;
reg       sign = 0;

always@(posedge rst_n )     //¿ª»úÎÊºò
    begin
       sign <= 1;
    end
	 


always@(posedge beat)
begin
    if(sign == 1)
    begin
	   if((cnt < 8)&&(cnt != 0))
         cnt <= cnt + 1;
	   else if(cnt == 8)
        cnt <= 0;
	 end
end

always@(posedge clk)
begin
   if(~rst_n)
	    data <= 8'b1111_1111;
   else
	begin
       if(cnt!=0)
	      data <= HI_data;
	    else
	      data <= TONE_data;
    end
end	

	

endmodule
