`include "light1.v"
`include "source.v"

module light_tb;
	wire x,y,f;
	reg clock;
	
	light1 light1(
		.x1(x),
		.x2(y),
		.clock(clock),
		.f(f)
	);

	source source(
		.clock(clock),
		.x(x),
		.y(y)
	);

	initial // Tudo dentro é executado somente uma vez
	begin
		$dumpfile("light.vcd"); // Especifica o arquivo 
		$dumpvars; // Especifica pra colocar todos os sinais 
		clock = 0;
		#1000 $finish;
	end
	always
	#10 clock = ~clock;
endmodule