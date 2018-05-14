module dpcm(in_valid,clock,reset,in_ready,data);

	input in_valid,clock,reset;
	output reg in_ready;
	input [3:0] data;	
	reg [3:0] out;	
	reg [3:0] previous;
	reg [1:0] state;
	parameter start=0,sub=1;
	
	always @ (posedge clock) begin 
		if(reset) begin
			out <= 3'b000;
			previous <= 3'b000;
			in_ready <= 1;
			state <= start;
		end
		else begin		
			case(state) 
				start: begin
					in_ready <=  1;
					state <= sub;
				end							
				sub: begin 
					if(in_valid) begin 
						out <= data - previous;
						$display(data," ",previous," ",out);
						in_ready <= 0;  
						previous <= data;
						state <= start;
					end
				end
			endcase
		end
	end
endmodule
