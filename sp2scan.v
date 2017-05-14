`timescale 1ns / 1ps
module ps2scan(
input clk, //50M时钟信号
input rst,  //复位信号
input ps2k_clk,   //PS2接口时钟信号
input ps2k_data,  //PS2接口数据信号
output reg[7:0] temp_data,  //当前接收数据寄存器
output reg[3:0] num, //计数寄存器
output neg_ps2k_clk   // ps2k_clk下降沿标志位
);
//------------------------------------------
reg ps2k_clk_r0,ps2k_clk_r1,ps2k_clk_r2;  //ps2k_clk状态寄存器
//wire pos_ps2k_clk;     // ps2k_clk上升沿标志位
always @ (posedge clk or negedge rst) begin
    if(!rst) begin
           ps2k_clk_r0 <= 1'b0;
           ps2k_clk_r1 <= 1'b0;
           ps2k_clk_r2 <= 1'b0;
       end
    else begin                         //锁存状态，进行滤波
           ps2k_clk_r0 <= ps2k_clk;
           ps2k_clk_r1 <= ps2k_clk_r0;
           ps2k_clk_r2 <= ps2k_clk_r1;
       end
end
assign neg_ps2k_clk = ~ps2k_clk_r1 & ps2k_clk_r2;    //下降沿
//------------------------------------------


always @ (posedge clk or negedge rst) begin
    if(!rst) begin
           num <= 4'd0;
           temp_data <= 8'd0;
       end
    else if(neg_ps2k_clk) begin //检测到ps2k_clk的下降沿
           case (num)
              4'd0:  num <= num+1'b1;
              4'd1:  begin
                         num <= num+1'b1;
                         temp_data[0] <= ps2k_data;  //bit0
                     end
              4'd2:  begin
                         num <= num+1'b1;
                         temp_data[1] <= ps2k_data;  //bit1
                     end
              4'd3:  begin
                         num <= num+1'b1;
                         temp_data[2] <= ps2k_data;  //bit2
                     end
              4'd4:  begin
                         num <= num+1'b1;
                         temp_data[3] <= ps2k_data;  //bit3
                     end
              4'd5:  begin
                         num <= num+1'b1;
                         temp_data[4] <= ps2k_data;  //bit4
                     end
              4'd6:  begin
                         num <= num+1'b1;
                         temp_data[5] <= ps2k_data;  //bit5
                     end
              4'd7:  begin
                         num <= num+1'b1;
                         temp_data[6] <= ps2k_data;  //bit6
                     end
              4'd8:  begin
                         num <= num+1'b1;
                         temp_data[7] <= ps2k_data;  //bit7
                     end
              4'd9:  begin
                         num <= num+1'b1;  //奇偶校验位，不做处理
                     end
              4'd10: begin
                         num <= 4'd0;  // num清零
                     end
              default: ;
              endcase
       end
end
endmodule
