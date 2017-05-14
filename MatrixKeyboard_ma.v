`timescale 1ns / 1ps
module MatrixKeyboardMain(
    input clk,
	 input rst_n,
	 input [3:0] row,               //行：输入
	 output reg [3:0] col,          //列：输出
	 output reg [3:0] med,
	 output reg [3:0] low
);

reg [5:0] count;     //20ms延迟
reg [2:0] state;     //状态标志
reg key_flag;        //按键标志位
reg clk_500k;
reg [3:0] col_reg;   //寄存扫描列
reg [3:0] row_reg;   //寄存扫描行

always@(posedge clk or negedge rst_n)   //50kHz信号生成，去抖动用
begin
    if(~rst_n)
	 begin
	     clk_500k <= 0;
		  count <= 0;
	 end
	 else
	 begin
	     if(count >= 50)
		  begin
		      clk_500k <= ~clk_500k;
				count <=0;
		  end
		  else 
		      count <= count + 1;
	 end
end


always@(posedge clk_500k or negedge rst_n)//扫描键盘输入
begin
    if(~rst_n)
	 begin
	     col <= 4'b0;
		  state <= 0;
	 end
	 else
	 begin
	     case(state)
		  3'd0:
		  begin
		      col[3:0] <= 4'b0000;
				key_flag <= 1'b0;
				if(row[3:0]!=4'b1111)    //若有键按下，扫描第一行
				begin
				    state <= 1;
					 col[3:0] <= 4'b1110;
				end
				else 
				    state <= 0;
		  end
		  3'd1:
		  begin
				if(row[3:0]!=4'b1111)    //若有键按下，扫描第一行
				    state <= 5;          //判断是否是第一行
				else
            begin				
			       state <= 2;
					 col[3:0] <= 4'b1101;
		      end
		  end
		  3'd2:
		  begin
				if(row[3:0]!=4'b1111)    //若有键按下，扫描第二行
				    state <= 5;          //判断是否是第二行
				else
            begin				
			       state <= 3;
					 col[3:0] <= 4'b1011;
		      end
		  end
		  3'd3:
		  begin
				if(row[3:0]!=4'b1111)    //若有键按下，扫描第三行
				    state <= 5;          //判断是否是第三行
				else
            begin				
			       state <= 4;
					 col[3:0] <= 4'b0111;
		      end
		  end
		  3'd4:
		  begin
				if(row[3:0]!=4'b1111)    //若有键按下，扫描第一行
				    state <= 5;          //判断是否是第一行
				else	
			       state <= 0;
		  end
		  3'd5:
		  begin
		      if(row[3:0]!=4'b1111)
				begin
				col_reg <= col;
				row_reg <= row;    //保存
				state <= 5;
				key_flag <= 1'b1;  //有键按下
				end
				else
				state <=0;
		  end
		  endcase
	 end
end

always@(posedge clk_500k )
begin
    if(key_flag == 1'b1)
	 begin
	     case({col_reg,row_reg})
		  8'b1110_1110:{med,low} <= 8'b0000_0100;   //低音4
		  8'b1110_1101:{med,low} <= 8'b0000_0101;   //低音5
		  8'b1110_1011:{med,low} <= 8'b0100_0000;   //中音4
		  8'b1110_0111:{med,low} <= 8'b0101_0000;   //中音5                                   
		  8'b1101_1110:{med,low} <= 8'b0000_0011;   //低音3
		  8'b1101_1101:{med,low} <= 8'b0000_0110;   //低音6
		  8'b1101_1011:{med,low} <= 8'b0011_0000;   //中音3
		  
		  8'b1011_1110:{med,low} <= 8'b0000_0010;   //低音2
		  8'b1011_1101:{med,low} <= 8'b0000_0111;   //低音7
		  8'b1011_1011:{med,low} <= 8'b0010_0000;   //中音2
		  8'b1011_0111:{med,low} <= 8'b0111_0000;   //中音7
		  8'b0111_1110:{med,low} <= 8'b0000_0001;   //低音1                                  
		  8'b1101_0111:{med,low} <= 8'b0110_0000;   //中音6
		  8'b0111_1011:{med,low} <= 8'b0001_0000;   //中音1
		  default: {med,low} <= 8'b0000_0000;
		 endcase
	end  
end
endmodule


