`timescale 1ns / 1ps
module ShowCode(
    input switch,
	 input [3:0]med,
	 input [3:0]low,
    output reg [3:0] sel = 4'b1101,
    output reg [7:0] data
    );
	 

always@(*)
begin
    if(switch == 1)
	     sel <= 4'b1101;
	 else 
	     sel <= 4'b1110;
end
//8'b 1 1 1 1 _ 1 1 1 1;
//    a b c d   e f g h


always@(med or low)
    if(sel == 4'b1101)
	 begin
	 if((med == 4'b0000)&&(low == 4'b0000))//ÐÝÖ¹·û
	     data = 8'b1111_1111;
    else if(med == 4'b0000)               //µÍÒô
	     data = 8'b1110_0011;
	 else                                  //ÖÐÒô
	     data = 8'b1001_0001;
    end	
    else if(sel == 4'b1110)
    begin
	     if(med == 0)
	     begin
				case(low)
		       4'h0: data = 8'b1111_1111;
				 4'h1: data = 8'b1001_1111;
				 4'h2: data = 8'b0010_0101;
				 4'h3: data = 8'b0000_1101;
				 4'h4: data = 8'b1001_1001;
				 4'h5: data = 8'b0100_1001;
				 4'h6: data = 8'b0100_0001;
				 4'h7: data = 8'b0001_1111;
			   default: data = 8'b1111_1111;
	 	      endcase
	     end
		  else
		  begin
		      case(med)
		       4'h0: data = 8'b1111_1111;
				 4'h1: data = 8'b1001_1111;
				 4'h2: data = 8'b0010_0101;
				 4'h3: data = 8'b0000_1101;
				 4'h4: data = 8'b1001_1001;
				 4'h5: data = 8'b0100_1001;
				 4'h6: data = 8'b0100_0001;
				 4'h7: data = 8'b0001_1111;
			   default: data = 8'b1111_1111;
	 	      endcase
		  end
    end	     
endmodule
