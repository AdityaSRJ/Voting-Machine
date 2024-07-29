
module modeControl(

clk,
reset,
mode,
valid_vote_casted,
candidate1_vote,
candidate2_vote,
candidate3_vote,
candidate4_vote,
candidate1_button_press,
candidate2_button_press,
candidate3_button_press,
candidate4_button_press,
leds


);

input clk;
input reset;
input mode;
input valid_vote_casted;
input[7:0] candidate1_vote;
input[7:0] candidate2_vote;
input[7:0] candidate3_vote;
input[7:0] candidate4_vote;
input candidate1_button_press;
input candidate2_button_press;
input candidate3_button_press;
input candidate4_button_press;

output[7:0] leds;

reg[7:0] leds;
reg[30:0] counter; // light the leds in mode 0 to time the amount of time which leds light up
wire [30:0] counter_next;

assign counter_next = counter + 1;


always@(posedge clk)
begin
	if(reset)
		counter <= 0;

	else if(valid_vote_casted)
		counter <= counter_next;

	else if(counter != 0 & counter < 10)
		counter <= counter_next;

	else 
		counter<= 0;
end

always@(posedge clk)
begin

	if(reset)
		leds <= 0;
	
	else
	begin
		if(mode == 0 & counter > 0) // mode0 = voting mode
			leds <= 8'hFF;      // mode1 = result mode

		else if(mode == 0)
			leds <= 0;

		else if(mode == 1)
		begin
			if(candidate1_button_press)
				leds <= candidate1_vote;

			else if(candidate2_button_press)
				leds <= candidate2_vote;

			else if(candidate3_button_press)
				leds <= candidate3_vote;


			else if(candidate4_button_press)
				leds <= candidate4_vote;

			else ;
		end
	end
end
endmodule



			

		

