`timescale 1ns / 1ps

module PS2_FSM(
	input  [7:0]temp_data,
	input  clk,
	input  rst,
	input  [3:0]num,
	input  neg_ps2k_clk,
	output reg[15:0]data,
	output reg press,
	output reg loose,
	output reg [2:0]next_state = 0
    );
	 parameter S0 = 3'b000; //
	 parameter S1 = 3'b001; //
	 parameter S2 = 3'b010; //
	 parameter S3 = 3'b011; //
	 parameter S4 = 3'b100; //
	 parameter S5 = 3'b101; //
	 parameter S6 = 3'b110;
	 parameter S7 = 3'b111; 
	 
	 reg [2:0]curr_state;
	 always @(posedge clk or negedge rst)
	 begin
		if(!rst)
			curr_state <= 0;
		else 
			curr_state <= next_state;
	 end
	always @(*)
	begin
			case(curr_state)
			S0: begin
				if(num==4'd10)
				begin
					if(temp_data == 8'hE0)
						next_state <= S4;
					else if(temp_data == 8'hF0)
						next_state <= S2;
					else
					     next_state <= S1;
				end
				else
					next_state <= next_state;
			end
			S1: next_state <= S0;
			S2: if(num==4'd10) 
					next_state <= S3;
			S3: next_state <= S0;
			S4: begin
				 if(num==4'd10)
				 begin
				 if(temp_data == 8'hF0)
					next_state <= S5;
				 else
					next_state <= S7;
				 end
			end
			S5: if(num==4'd10) 
					next_state <= S6;
			S6: next_state <= S0;
			S7: next_state <= S0;
			endcase
	end
	always @ (posedge clk or negedge rst)
	begin
		if(!rst) begin
			press <= 0;
			loose <= 0;
		end
		else if(num==4'd10) begin
			case(next_state)
			S0:	begin
				press <= 0;
				loose <= 0;
			end
			S1: begin
				press <= 1;
				loose <= 0;
				data[7:0] <= temp_data;
				data[15:8] <= 8'b0;
			end
			S2: begin
				press <= 0;
				loose <= 0;
			end
			S3: begin
				press <= 0;
				loose <= 1;
				data[7:0] <= temp_data;
				data[15:8] <= 8'b0;
			end
			S4: begin
				press <= 0;
				loose <= 0;
			end
			S5:	begin
				press <= 0;
				loose <= 0;
			end
			S6: begin
				press <= 0;
				loose <= 1;
				data<={8'hE0,temp_data};
			end
			S7: begin
				press <= 1;
				loose <= 0;  
				data<={8'hE0,temp_data};
			end
			endcase
		end
		else begin
			press <= 1;
			loose <= 0;
		end
	end

endmodule
