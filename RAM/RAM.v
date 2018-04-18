module RAM (
	input [7:0] data,
	input [5:0] addr,
	input we, clk,
	output [5:0] q
);

	// declara a variável RAM
	reg [7:0] ram[63:0];

	// variável para guardar o endereco de dado registrado
	reg [5:0] addr_reg;

	always @ (posedge clk)
	begin
		// Escreve
		if (we)  // Write enable  
			ram[addr] <= data;
		addr_reg <= addr;
	end

	// Continuous assignment implies read returns NEW data.	
	assign q = ram[addr_reg];

endmodule
