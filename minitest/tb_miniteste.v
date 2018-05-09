`include "minitest.v"

module tb_miniteste();
	 
	reg alarme,dia_util,reset,desligado, clock;
	
	minitest minitest(
		.alarme(alarme), 
		.dia_util(dia_util), 
		.clock(clock),
		.reset(reset),
		.desligar(desligar)
	);

	initial // Tudo dentro é executado somente uma vez
	begin
		reset = 1;
		#10 reset = 0; 
		alarme <= 1;
		dia_util <= 1;
		
		$dumpfile("wave.vcd"); // Especifica o arquivo 
		$dumpvars; // Especifica pra colocar todos os sinais 
		clock = 0;
		#1000 $finish;
	end
	always
	#10 clock = ~clock;

endmodule
