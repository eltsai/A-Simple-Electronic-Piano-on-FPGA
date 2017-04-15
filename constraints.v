
    NET "clk"             LOC = "B8";
	 
	 NET "rst_n" CLOCK_DEDICATED_ROUTE = FALSE; 
	 NET "rst_n"           LOC = "G18";
	 
	 NET "data<7>"         LOC = "L18";
	 NET "data<6>"         LOC = "F18";
	 NET "data<5>"         LOC = "D17";
	 NET "data<4>"         LOC = "D16";
	 NET "data<3>"         LOC = "G14";
	 NET "data<2>"         LOC = "J17";
	 NET "data<1>"         LOC = "H14";
	 NET "data<0>"         LOC = "C17";


	 
	 NET "sel<0>"          LOC = "F17";
	 NET "sel<1>"          LOC = "H17";
	 NET "sel<2>"          LOC = "C18";
	 NET "sel<3>"          LOC = "F15";
	 
	 NET "beep_ch"         LOC = "N18";
	 NET "beep_ma"         LOC = "R15";
	 
    NET "func<0>"         LOC = "H18";
	 NET "func<1>"         LOC = "K18";
	 
	 NET "L<7>"            LOC = "R4";
    NET "L<6>"            LOC = "F4";
    NET "L<5>"            LOC = "P15";
    NET "L<4>"            LOC = "E17";


    NET "L<3>"            LOC = "K14";
    NET "L<2>"            LOC = "K15"; 
    NET "L<1>"            LOC = "J15";
    NET "L<0>"            LOC = "J14";
	 
	 
    NET "ps2k_clk"        LOC = "R12"; # Bank = 2, Pin name = IO_L20N_2, Type = I/O, Sch name = PS2C
    NET "ps2k_data"       LOC = "P11"; # Bank = 2, Pin name = IO_L18P_2, Type = I/O, Sch name = PS2D

    NET "col_ma<0>"       LOC = "L15"; # Bank = 1, Pin name = IO_L09N_1/A11, Type = DUAL, Sch name = JA1
    NET "col_ma<1>"       LOC = "K12"; # Bank = 1, Pin name = IO_L11N_1/A9/RHCLK1, Type = RHCLK/DUAL, Sch name = JA2
    NET "col_ma<2>"       LOC = "L17"; # Bank = 1, Pin name = IO_L10N_1/VREF_1, Type = VREF, Sch name = JA3
    NET "col_ma<3>"       LOC = "M15"; # Bank = 1, Pin name = IO_L07P_1, Type = I/O, Sch name = JA4
    NET "row_ma<0>"       LOC = "K13"; # Bank = 1, Pin name = IO_L11P_1/A10/RHCLK0, Type = RHCLK/DUAL, Sch name = JA7
    NET "row_ma<1>"       LOC = "L16"; # Bank = 1, Pin name = IO_L09P_1/A12, Type = DUAL, Sch name = JA8
    NET "row_ma<2>"       LOC = "M14"; # Bank = 1, Pin name = IO_L05P_1, Type = I/O, Sch name = JA9
    NET "row_ma<3>"       LOC = "M16"; # Bank = 1, Pin name = IO_L07N_1, Type = I/O, Sch name = JA10

	 NET "col_ch<0>"       LOC = "G15";
	 NET "col_ch<1>"       LOC = "J16";
	 NET "col_ch<2>"       LOC = "G13";
	 NET "col_ch<3>"       LOC = "H16";
	 NET "row_ch<0>"       LOC = "H15";
	 NET "row_ch<1>"       LOC = "F14";
	 NET "row_ch<2>"       LOC = "G16";
	 NET "row_ch<3>"       LOC = "J12";
