`include "RAM.v"
`include "source_RAM.v"

module machine_tb;
	wire [7:0] data;
	wire [5:0] addr; 
	wire we;
	wire [5:0] q;
	reg clock;
	
	RAM RAM(
		.data(data),
		.addr(addr),
		.we(we),
		.clk(clock),
		.q(q)
	);

	source source(
		.we(we),
		.addr(addr),
		.data(data),		
		.clk(clock)	
	);

	initial // Tudo dentro é executado somente uma vez
	begin
		$dumpfile("wave.vcd"); // Especifica o arquivo 
		$dumpvars; // Especifica pra colocar todos os sinais 
		clock = 0;
		#1000 $finish;
	end
	always
	#3 clock = ~clock;
endmodule
