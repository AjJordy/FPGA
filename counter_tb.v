`include "counter.v"

module counter_tb;
	reg clk, reset, enable;
	counter counter(
		.reset(reset),
		.clk(clk),
		.enable(enable)
	);
	
	initial // Everything in initial execute just one time
	begin 
		clk = 0;
		reset = 1;     // Reset
		#10 reset = 0; // After 10 times unit
		enable = 1;
		$dumpfile("counter.vcd"); // File with the wave format
		$dumpvars;     // Verify all variables
		#2000 $finish;  // Finish the testbench
	end
	always
	#5 clk = !clk;	   // Invert the clock's sinal
endmodule