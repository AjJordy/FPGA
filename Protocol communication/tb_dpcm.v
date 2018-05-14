`include "dpcm.v"
`include "source.v"

module tb_dpcm();

	wire in_ready,in_valid,reset;
	wire [3:0] data;
	reg clock;	

	dpcm dpcm(
		.in_ready(in_ready),
		.in_valid(in_valid),
		.clock(clock),
		.reset(reset),
		.data(data)
	);

	source source(
	  .in_ready(in_ready),
		.in_valid(in_valid),
		.clock(clock),
		.reset(reset),
		.data(data)
	);	

	initial begin
		$dumpfile("wave.vcd"); 
		$dumpvars; 
		clock = 0;
		#1000 $finish;
	end

	always begin
		# 10;
		clock = ~clock;
	end
endmodule 
