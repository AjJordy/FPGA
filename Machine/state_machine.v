module state_machine
	(output reg valve,shake_mode,turn_mode,
	 input clock, reset_n,start, full, Time, dry);
	 
	reg[1:0] this_state;
	parameter Wait=0,fill=1,shake=2,turn=3;
	
	always @ (*) begin // Parte combinacional
		case(this_state)
			Wait: begin
					valve = 0; shake_mode = 0; turn_mode = 0;
				  end
		        fill: begin
					valve = 1; shake_mode = 0; turn_mode = 0;
				  end
			shake: begin
					valve = 0; shake_mode = 1; turn_mode = 0;
				   end
			turn: begin
					valve = 0; shake_mode = 0; turn_mode = 1;
				  end
		endcase
	end

	always @ (posedge clock, negedge reset_n) // Parte sequencial 
		if(~reset_n)
			this_state <= Wait;
		else begin
			case(this_state)
				Wait: if(start == 1)
					this_state <= fill;
				fill: if(full == 1)
					this_state <= shake;
				shake: if(Time == 1)
					this_state <= turn;
				turn: if(dry == 1)
					this_state <= Wait;
			endcase
		end
	end
endmodule

// gtkwave 
			
