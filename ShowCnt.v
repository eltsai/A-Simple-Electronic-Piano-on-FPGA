`timescale 1ns / 1ps
module ShowCnt(
    input clk,
    input rst_n,
    input cnt_en,
    output reg [7:0] cnt_data
    );
	 
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n )                  //重置
	     cnt_data <= 8'h90;
    else if(cnt_en)
        begin
	             if(cnt_data == 8'h99)
		              cnt_data <= 8'h00;   //计数到99后，从0开始
                else if(cnt_data[3:0] == 4'h9)
		              cnt_data <= cnt_data + 8'h7;//个位为9，进位
                else
			           cnt_data <= cnt_data + 8'h1;        
	     end
 end

endmodule