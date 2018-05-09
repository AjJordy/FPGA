module minitest(input alarme, dia_util, clock, reset,
				   output reg desligar);

	parameter dormindo=0, acordado=1, levantado=2;
	reg[1:0] estado = 0;
	
	always @ (posedge clock) begin 
		if(reset)
			estado <= 0;
		else begin
			case(estado) 
				dormindo: if(alarme)
					estado <= acordado;
				acordado: begin 
					desligar <= 1;
					if(dia_util)
						estado <= levantado;
					else
						estado <= dormindo;
				end
			endcase
		end
	end
endmodule
