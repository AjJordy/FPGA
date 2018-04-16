`include "state_machine.v"
`include "source.v"

module machine_tb;
	wire reset_n, start, full, Time, dry,valve,shake_mode,turn_mode;
	reg clock;
	
	state_machine state_machine(
		.reset_n(reset_n),
		.start(start),
		.full(full),
		.Time(Time),
		.dry(dry),
		.clock(clock),
		.valve(valve),
		.shake_mode(shake_mode),
		.turn_mode(turn_mode)
	);

	source source(
		.clock(clock),
		.reset_n(reset_n),
		.start(start),
		.full(full),
		.Time(Time),
		.dry(dry)		
	);

	initial // Tudo dentro é executado somente uma vez
	begin
		$dumpfile("machine.vcd"); // Especifica o arquivo 
		$dumpvars; // Especifica pra colocar todos os sinais 
		clock = 0;
		#1000 $finish;
	end
	always
	#10 clock = ~clock;
endmodule
