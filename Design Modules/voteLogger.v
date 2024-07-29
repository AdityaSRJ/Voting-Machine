module voteLogger(

clk,
reset,
mode,   // 0 for vote registering and 1 for vote display
cand1_vote_valid,
cand2_vote_valid,
cand3_vote_valid,
cand4_vote_valid,

cand1_vote_recvd,
cand2_vote_recvd,
cand3_vote_recvd,
cand4_vote_recvd,

);

input clk;
input reset;
input mode;
input cand1_vote_valid;
input cand2_vote_valid;
input cand3_vote_valid;
input cand4_vote_valid;

output [7:0] cand1_vote_recvd;
output [7:0] cand2_vote_recvd;
output [7:0] cand3_vote_recvd;
output [7:0] cand4_vote_recvd;

reg [7:0] cand1_vote_recvd;
reg [7:0] cand2_vote_recvd;
reg [7:0] cand3_vote_recvd;
reg [7:0] cand4_vote_recvd;

wire [7:0] cand1_vote_recvd_next;
wire [7:0] cand2_vote_recvd_next;
wire [7:0] cand3_vote_recvd_next;
wire [7:0] cand4_vote_recvd_next;

assign cand1_vote_recvd_next = cand1_vote_recvd + 1;
assign cand2_vote_recvd_next = cand2_vote_recvd + 1;
assign cand3_vote_recvd_next = cand3_vote_recvd + 1;
assign cand4_vote_recvd_next = cand4_vote_recvd + 1;

always@(posedge clk)
begin
	if(reset)
	begin
		cand1_vote_recvd <= 0;
		cand2_vote_recvd <= 0;		
		cand3_vote_recvd <= 0;
		cand4_vote_recvd <= 0;
	end

	else
	begin
		if(cand1_vote_valid & mode == 0)
			cand1_vote_recvd <= cand1_vote_recvd_next;

		else if(cand2_vote_valid & mode == 0)
			cand2_vote_recvd <= cand2_vote_recvd_next;

		else if(cand3_vote_valid & mode == 0)
			cand3_vote_recvd <= cand3_vote_recvd_next;

		else if(cand4_vote_valid & mode == 0)
			cand4_vote_recvd <= cand4_vote_recvd_next;

		else;
	end
end

endmodule
