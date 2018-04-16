module light1(x1,x2,clock,f);
	input x1,x2,clock;
	output reg f;
	always@ (posedge clock)
	begin 
		f = (x1 & ~x2)|(~x1 & x2);
		$display (x1,x2,f);
	end
endmodule
