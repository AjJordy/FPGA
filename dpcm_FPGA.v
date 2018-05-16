module dpcm_FPGA(SW,LEDR,LEDG);
	input [5:0] SW;
	output reg [9:0] LEDR;
	output reg [1:0] LEDG;
	wire in_ready;
	reg [3:0] data;
	wire [3:0] out;	
	
	dpcm dpcm(
		.clock(SW[0]),
		.reset(SW[1]),
		.in_ready(in_ready),
		.in_valid(SW[2]),
		.data(data),
		.out(out)
	);
	
	initial begin
		data <= 1;
		LEDR <= 0;
	end
	
	always @ (posedge SW[0]) begin
		LEDG[0] <= in_ready;
		if(in_ready) begin
			data = data + 1;
			LEDR[out] <= 1;
		end
	end
endmodule
 