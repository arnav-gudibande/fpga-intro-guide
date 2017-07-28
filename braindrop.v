module braindrop (clk, IN0, IN1, LEDG, LEDR);
	input clk, IN0, IN1;     // clock typically from 10MHz to 50MHz
	output reg [7:0] LEDG, LEDR;
	integer j;

	// create a binary counter
	reg [31:0] cnt;
	always @(posedge clk)
	begin

	for (j=0; j<8; j=j+1) begin
		LEDR[j] = 1;
		LEDG[j] = 1;
	end

		cnt <= cnt+1;

		if ((IN0 == 0) & (IN1 == 1))
		begin
			for (j=0; j<8; j=j+1) begin
				LEDR[j] = cnt[22];
				LEDG[j] = 1;
			end
		end
		else if ((IN0 == 1) & (IN1 == 0))
		begin
			for (j=0; j<8; j=j+1) begin
				LEDG[j] = cnt[22];
				LEDR[j] = 1;
			end
		end
		else if (~IN0 & ~IN1)
		begin
			for (j=0; j<8; j=j+1) begin
				LEDG[j] = cnt[22];
				LEDR[j] = cnt[22];
			end
		end
	end

endmodule
