`timescale 1ns / 1ps
module beep_ch(           //音频信号产生模块
    input beat,
    input clk_5m,
    output reg beep,  //方波信号
    input [3:0] med,
    input [3:0] low
    );

reg carrier;
reg [13:0] div;
reg [13:0] org;

always@(posedge clk_5m)
begin
    carrier <= (div == 16383);
    if(carrier)
	     div <= org;
	 else
	     div <= div + 1;
end

always@(posedge carrier)   //方波信号产生
begin 
	 beep <= ~beep;
end

always@(posedge beat)//校歌里用到了低音5,6，中音1,2,3,5,6，
begin
    case({med,low})
	 'b0000_0001:org <= 6826;     //低音1
	 'b0000_0010:org <= 7871;     //低音2
	 'b0000_0011:org <= 8798;     //低音3
	 'b0000_0100:org <= 9224;     //低音4
	 'b0000_0101:org <= 10005;    //低音5
	 'b0000_0110:org <= 10701;    //低音6
	 'b0000_0111:org <= 11321;    //低音7
	 'b0001_0000:org <= 11606;    //中音1
	 'b0010_0000:org <= 12126;    //中音2
	 'b0011_0000:org <= 12591;    //中音3
	 'b0100_0000:org <= 12804;    //中音4
	 'b0101_0000:org <= 13194;    //中音5
	 'b0110_0000:org <= 13542;    //中音6
	 'b0111_0000:org <= 13852;    //中音3
	 'b0000_0000:org <= 16383;    //休止符
	 endcase
end

endmodule
