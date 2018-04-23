`include "XOR.v"

module tb_xor();
	reg x1,x2;
	wire f;

	XOR XOR(
		.x1(x1),
		.x2(x2),
		.f(f)
	);		

	initial begin
		x1<=0;
		x2<=0;
		$dumpfile("xor.vcd"); // Especifica o arquivo 
		$dumpvars; // Especifica pra colocar todos os sinais 
		#1000 $finish;	
	end

	always begin	
		#10;
		x1=1;
		x2=0;
		#10;
		x1=0;
		x2=1;
		#10;
		x1=1;
		x2=1;
	end
	
endmodule
