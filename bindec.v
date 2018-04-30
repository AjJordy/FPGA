module bindec (SW, LEDR, HEX1, HEX0);
	input [7:0] SW;
	output [7:0] LEDR;
	output [0:6] HEX1, HEX0;
	assign LEDR = SW;
	bcd7seg digit1 (SW[7:4], HEX1);
	bcd7seg digit0 (SW[3:0], HEX0);
endmodule

module bcd7seg (B, H);
	input [3:0] B;
	output [0:6] H;
	wire [0:6] H;
	assign H[0] = ~(B[0] | B[2] | B[1]&B[3] | ~B[1]&~B[3]);    
	assign H[1] = ~(~B[1] | ~B[2]&~B[3] | B[2]&B[3]);
	assign H[2] = ~(B[1] | ~B[2] | B[3]); 
	assign H[3] = ~(B[0] | ~B[1]&~B[3] | ~B[1]&B[2] | B[2]&~B[3] | B[1]&~B[2]&B[3]);
	assign H[4] = ~(~B[1]&~B[3] | B[2]&~B[3]);
	assign H[5] = ~(B[0] | ~B[2]&~B[3] | B[1]&~B[2] | B[1]&~B[3]);
	assign H[6] = ~(B[0] | B[1]&~B[2] | ~B[1]&B[2] | B[2]&~B[3]);
endmodule 