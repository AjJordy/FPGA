module source(clk,data,addr,we);
	input clk;
	output reg [7:0] data;
	output reg [5:0] addr;
	output reg we;	
	
	initial
	begin
		we = 1;
		data = 0;
		addr = 0;
		
	end
	
	always @ (posedge clk)
	begin
		addr = data + 5;
		data = data + 5;  
		//#2;
		//addr = 20;
		//data = 20;
		//#2;
		//addr = 30;
		//data = 30;
		
	end
endmodule
