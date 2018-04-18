`include "maquina.v"
module maquina_tb;
reg inicio, cheio, tempo, secar, reset_n, clock;
maquina maquina(.inicio (inicio), .cheio (cheio), .tempo (tempo), .secar(secar), .reset_n(reset_n), .clock(clock));
initial begin
	$dumpfile("maquina.vcd");  //especifica em qual arquivo serao armazenadas as formas de onda
	$dumpvars;  //especifica para colocar todos os sinais no counter.vcd 
	
	inicio = 0;
	cheio = 0;
	tempo =1;
	secar=1;
	clock = 0;
	#10;
	reset_n=0;
	#10;
	reset_n=1;
	#10;
	inicio = 1;
	cheio= 1;
	tempo=1;
	secar=1;
	#10;
	inicio = 1;
	cheio= 1;
	tempo=1;
	secar=0;
#10;
	inicio = 1;
	cheio= 1;
	tempo=1;
	secar=0;	
	
	
	#10;
	inicio = 1;
	cheio= 1;
	tempo=1;
	secar=0;	
	#10;
	inicio = 1;
	cheio= 1;
	tempo=1;
	secar=0;	
	
	
	#150 $finish;
 end

always
	#5 clock = ~clock;
 
endmodule