module display(SW,HEX0);	
	output reg [0:6] HEX0;
	input [8:0] SW;
	/*
	* 		0
	*	 -----	
	*5 |     | 1
	* 	|  6  | 
	*   -----
	*4 |	   | 2
	*  |     |
	*   -----
	*		3
	*/
	always @(*) begin
		if(SW[0]) 
		begin
			 HEX0[0] = 0;
			 HEX0[1] = 0;
			 HEX0[2] = 0;
			 HEX0[3] = 0;
			 HEX0[4] = 0;	
			 HEX0[5] = 0;
			 HEX0[6] = 1;

		end else if(SW[1]) 
		begin
			 HEX0[0] = 1;
			 HEX0[1] = 0;
			 HEX0[2] = 0;
			 HEX0[3] = 1;
			 HEX0[4] = 1;	
			 HEX0[5] = 1;
			 HEX0[6] = 1;	
		end
	end
	
endmodule 