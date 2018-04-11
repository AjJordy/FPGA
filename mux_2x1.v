module mux_2x1(a,b,sel,out);
	input a,b,sel;
	output reg out;
	always @(a or b or sel)
	begin 
		if(sel==1)
			out = a;
		else out = b;		 
	end
endmodule