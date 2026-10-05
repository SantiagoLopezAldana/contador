module button_onepulse (
	input wire clk,
	input wire rst,
	input wire button_n,
	output reg press_pulse);
	
	localparam [18:0] DEBOUNCE_COUNT = 19'd499_999;
	
	reg [1:0] sync_ff;
	reg stable_n;
	reg [18:0] counter;
	
	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			sync_ff <= 2'b11;
			stable_n <= 1'b1;
			counter <= 19'd0;
			press_pulse <= 1'b0;
		end	 else begin
			sync_ff <= {sync_ff[0], button_n};
		  	press_pulse <= 1'b0;
			
			if (sync_ff[1] == stable_n) begin
				counter <= 19'b0;
			end else if (counter == DEBOUNCE_COUNT) begin
				counter <= 19'b0;
				stable_n <= sync_ff[1];
				
				if((stable_n == 1'b1) && (sync_ff[1] == 1'b0))
					press_pulse <= 1'b1;
			end	else begin
				counter <= counter + 19'd1;
			end
		end
	end
	
endmodule