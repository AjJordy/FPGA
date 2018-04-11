module counter(clk,reset,enable, count);
	input clk,reset, enable;
	output reg [3:0] count;

	always @ (posedge clk)
	begin 
		if(reset == 1'b1)
			count <= 0;
		else if(enable == 1'b1)
			count <= count +1;
		$display(count);
	end
endmodule