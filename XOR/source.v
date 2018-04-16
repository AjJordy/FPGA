module source(clock,x,y);
	input clock;
	output reg x,y;
	
	initial
	begin
		x<=0;
		y<=0;
	end
	
	always @ (posedge clock)
	begin	
		x <= !x;
		y <= 1;
	end
endmodule