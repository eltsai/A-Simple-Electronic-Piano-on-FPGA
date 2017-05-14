`timescale 1ns / 1ps
module ShowSwitch(
    input clk,
    output reg switch = 1'b0
    );

reg [15:0] select;

always@(posedge clk)
begin
    if(select == 16'd49_999)
	     select <= 16'd0;
	 else 
	     select <= select + 1;
end

always@(posedge clk)
begin 
    if(select == 16'd49_999)
	 begin
	     if(switch == 1'b1)
		      switch <= 1'b0;
		  if(switch == 1'b0)
		      switch <= 1'b1;
    end
end
endmodule