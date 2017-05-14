`timescale 1ns / 1ps

module Hello(
    input clk,
    input rst_n,
	 input [3:0] sel,
    output reg [7:0] data
    );
	 
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
	 begin
	     data <= 8'b1111_1111;
	 end
	 else
    begin
    if(sel == 4'b1101)
	 data <= 8'b1001_0001;
	 else
	 data <= 8'b1001_1111;
	 end
end
endmodule
