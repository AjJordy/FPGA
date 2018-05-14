module source(in_ready,in_valid,clock,reset,data);
	
	input in_ready,clock;
	output reg in_valid, reset;
	output reg [3:0] data;		

	initial begin
		data <= 3'b001;
		reset <= 1;
		# 15;
		reset <= 0;
	end

	always @ (posedge clock) begin

			while (~in_ready)
			#5;
			in_valid = 1;
			data = data + 1;
			#5;
			while(in_ready)
			#5;
			in_valid = 0;		
	end
	
	
endmodule 
