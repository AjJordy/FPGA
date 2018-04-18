module source(clock,reset_n,start,Time,full,dry);
	input clock;
	output reg reset_n, start, full, Time, dry;
	
	initial
	begin
		reset_n <= 0; start <= 0; Time <= 0; full <= 0; dry <= 0; 
	end
	
	always @ (posedge clock)
	begin
		reset_n = 1;
		
		start = 1; 	
		#100;
		Time = 1;
		#100;
		full = 1;
		#100;
		dry = 1;
		#100;
	end
endmodule
