module buttonControl(

clk,
reset,
button,
valid_vote

);

input clk;
input reset;
input button;
output valid_vote;

reg valid_vote;

reg [30:0] counter; // timer to seee how long button hads been pressed

always@(posedge clk)
begin

	if(reset) 
		counter <= 0;

	else
	begin
		if(button & counter <11)
			counter <= counter + 1;

		else if(!button)
			counter <= 0;

		else ;
	end
end

always@(posedge clk)
begin
	if(reset)
		valid_vote <= 0;

	else 
	begin
		if(counter == 10)
			valid_vote <= 1'b1; // will be high only for one clock pulse

		else
			valid_vote <= 1'b0;
	end
end

endmodule




