module ws_tb(SW,LEDR,CLOCK_50);
	input [5:0] SW;
	input CLOCK_50;
	output [3:0] LEDR;
	
	wash_machine wash_machine(
		.reset_n(SW[0]),
		.start(SW[1]),
		.full(SW[2]),
		.Time(SW[3]),
		.dry(SW[4]),
		.valve(LEDR[0]),
		.shake_mode(LEDR[1]),
		.turn_mode(LEDR[2]),	
		.clock(CLOCK_50)
	);
endmodule
 
	
