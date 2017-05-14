`timescale 1ns / 1ps

module top(
    input         clk,       //50MHz时钟
    input         rst_n,     //开机键
    output  [3:0] sel,       //分时复用
    output  [7:0] data,      //数码管显示的数据
	 output        beep_ma,   //主声：音频信号
	 output        beep_ch,   //和声：音频信号
	 input   [1:0] func,      //功能选择：弹奏或播放
	 
	 input   [3:0] row_ma,    //主声行输入
	 output  [3:0] col_ma,    //主声列输出
	 input   [3:0] row_ch,    //和声行输入
	 output  [3:0] col_ch,    //和声列输出
	 
	 output  [7:0] L,         //流水灯

    input         ps2k_clk,  //键盘扫描时钟
    input         ps2k_data  //键盘扫描码
);

    wire    [7:0] HI_data;   //数码管显示的数据
	 wire    [7:0] TONE_data; //数码管显示的数据
	 wire          switch;    //辅助分时复用         --
    wire          cnt_en;    //辅助分时复用            >  数码管用
    wire    [7:0] cnt_data;  //辅助分时复用         --
	 wire          beat;      //节拍，每拍1/4音符
	 reg           cnt_5m;    //音高生成辅助频率

	 wire    [3:0] med_ma0;     //主声：中音do-ti：小键盘输入
	 wire    [3:0] low_ma0;     //主声：低音do-ti
	 wire    [3:0] med_ch0;     //和声：中音do-ti
	 wire    [3:0] low_ch0;     //和声：低音do-ti


	 wire    [3:0] med_ma;     //主声：中音do-ti：输出到音高产生程序
	 wire    [3:0] low_ma;     //主声：低音do-ti
	 wire    [3:0] med_ch;     //和声：中音do-ti
	 wire    [3:0] low_ch;     //和声：低音do-ti

	 wire    [3:0] med_ma1;     //主声：中音do-ti：校歌
	 wire    [3:0] low_ma1;     //主声：低音do-ti

	 wire    [3:0] med_ma2;     //主声：中音do-ti：欢乐颂
	 wire    [3:0] low_ma2;     //主声：低音do-ti
	 wire    [3:0] med_ch2;     //和声：中音do-ti
	 wire    [3:0] low_ch2;     //和声：低音do-ti
	 
	 wire    [3:0] med_ma3;     //主声：中音do-ti：ps2键盘输入
	 wire    [3:0] low_ma3;     //主声：低音do-ti
	 wire    [3:0] med_ch3;     //和声：中音do-ti
	 wire    [3:0] low_ch3;     //和声：低音do-ti
	 
	  
    wire    [15:0] data_ps2;
    wire    [7:0]  temp_data;
    wire    [3:0]  num;
    wire           press;
    wire           loose;
    wire           neg_ps2k_clk;
    wire           [2:0]next_state;
	 



    Hello     u_Hello(        //开机问候模块
    .clk(clk),
    .rst_n(rst_n),
	 .sel(sel),
    .data(HI_data)
    );


    ToneFromKB_main u_ToneFromKB_main(  //按键转音调模块
    .clk(clk), 
    .rst_n(rst_n), 
    .data(data_ps2),
	 .low_ma(low_ma3),
	 .med_ma(med_ma3)
    );

    ToneFromKB_Chorus u_ToneFromKB_Chorus(  //按键转音调模块
    .clk(clk), 
    .rst_n(rst_n), 
    .data(data_ps2),
	 .low_ch(low_ch3),
	 .med_ch(mad_ch3)
    );
	 
	 
    ps2scan u_ps2scan (  //ps2键盘扫描
    .clk(clk), 
    .rst(rst_n), 
    .ps2k_clk(ps2k_clk), 
    .ps2k_data(ps2k_data), 
    .temp_data(temp_data),
	 .num(num),
	 .neg_ps2k_clk(neg_ps2k_clk)
    );
	 
     PS2_FSM u_FSM (  //ps2键盘扫描状态机
    .temp_data(temp_data), 
    .clk(clk), 
    .rst(rst_n), 
    .num(num),
	 .neg_ps2k_clk(neg_ps2k_clk),
    .data(data_ps2), 
    .press(press), 
    .loose(loose),
	 .next_state(curr_state)
    );
	 
	 MatrixKeyboardMain      u_MatrixKeyboardMain(   //主声部分键盘扫描  
    .clk(clk),
	 .rst_n(rst_n),
	 .row(row_ma),
	 .col(col_ma),   
	 .med(med_ma0),
	 .low(low_ma0)
    );
	 
	 
	 MatirxKeyboardChorus      u_MatirxKeyboardChorus(   //和声部分键盘扫描
    .clk(clk),
	 .rst_n(rst_n),
	 .row(row_ch),
	 .col(col_ch),   
	 .med(med_ch0),
	 .low(low_ch0)
    );
	 
	 
    beat       u_beat(       //节拍产生模块  
    .rst_n(rst_n),
    .clk(clk),
    .beat(beat)
    );
	 
	 
	 SongHz     u_SongHz(    //音高生成辅助频率模块
	 .clk(clk),
	 .rst_n(rst_n),
	 .clk_5m(clk_5m)
	 );
	 

	 
	 beep_ma       u_beep_ma(      //主声音频信号产生模块
	 .beat(beat),
    .clk_5m(clk_5m),
    .beep(beep_ma),  
    .med(med_ma),
    .low(low_ma)
	 );
	 
	
	 
	 beep_ch       u_beep_ch(      //和声音频信号产生模块
	 .beat(beat),
    .clk_5m(clk_5m),
    .beep(beep_ch),  
    .med(med_ch),
    .low(low_ch)
	 );
	 
	 
    SchoolSong  u_SchoolSong(    //播放校歌的模块
	 .func(func),
    .beat(beat),
    .clk_5m(clk_5m),
    .med(med_ma1),
    .low(low_ma1)
    );
	 
	 
	 OdeAnDieFreude  u_OdeAnDieFreude(  //欢乐颂
    .beat(beat),
    .clk_5m(clk_5m),
    .med_ma(med_ma2),
    .low_ma(low_ma2),
	 .med_ch(med_ch2),
    .low_ch(low_ch2)
    );
	 
    WaterLight  u_WaterLight(       //流水灯模块
    .beat(beat),
    .func(func),
    .L(L),
    .rst_n(rst_n)
    );	 
	 
	 CodeCh  u_CodeCh(          //选择显示Hi或是音高
	 .data(data),
	 .clk(clk),
	 .rst_n(rst_n),
	 .HI_data(HI_data),
	 .TONE_data(TONE_data),
	 .beat(beat)
	 );
	 
	 
	 Choose    u_Choose(          //选择模块：哪个部分输入的音调传给生成模块
    .func(func),
	 .clk(clk),
    .med_ma1(med_ma1),
    .low_ma1(low_ma1),
	 
    .low_ma(low_ma),
	 .med_ma(med_ma),
	 .med_ch(med_ch),
    .low_ch(low_ch),
	 
	 .med_ma2(med_ma2),
	 .low_ma2(low_ma2),
	 .med_ch2(med_ch2),
	 .low_ch2(low_ch2),
	
    .med_ma3(med_ma3),
	 .low_ma3(low_ma3),
	 .med_ch3(med_ch3),
	 .low_ch3(low_ch3),	
 
	 .med_ch0(med_ch0),
	 .med_ma0(med_ma0),
    .low_ma0(low_ma0),
    .low_ch0(low_ch0)
    );
	 


    //数码管显示部分：
    ShowDiv    u_ShowDiv(
    .clk       (clk    ),
    .rst_n     (rst_n    ),
    .cnt_en    (cnt_en )
    );
	 
	 ShowSwitch     u_ShowSwitch(
	 .clk       (clk     ),
	 .switch    (switch  )
	 );
	 
	 ShowCnt        u_ShowCnt(
	 .clk       (clk    ),
    .rst_n     (rst_n    ),
    .cnt_en    (cnt_en ),
	 .cnt_data  (cnt_data )
	 );


    ShowCode    u_ShowCode(        //只显示主声的音高
	 .switch    (switch         ),
    .med       (med_ma    ),
	 .low       (low_ma    ),
    .sel       (sel    ),
    .data      (TONE_data    )
    );	 
	 
	 
 
endmodule