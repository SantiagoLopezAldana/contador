`timescale 1ns/1ps

module tb_contador;	
	reg clk;
	reg tick;
	reg rst;
	reg pause_state;
	reg descendant_state;
	reg ascendant_state;
	
	wire signed [8:0] cuenta; 

	contador DUT (
		.clk(clk), 
		.tick(tick), 
		.rst(rst), 
		.pause_state(pause_state), 
		.descendant_state(descendant_state), 
		.ascendant_state(ascendant_state), 
		.cuenta(cuenta)
	);


	always #5 clk = ~clk;

	initial begin
		$monitor("Tiempo=%0t | rst=%b pausa=%b desc=%b asc=%b tick=%b | cuenta=%d", 
		         $time, rst, pause_state, descendant_state, ascendant_state, tick, cuenta);
		
		// 1. Inicialización y Reset
		clk = 0; tick = 0; pause_state = 0; descendant_state = 0; ascendant_state = 0;
		rst = 1; 
		#10 rst = 0;

		// 2. Prueba de Incremento
		#10 ascendant_state = 1; 
		#10 ascendant_state = 0; 
		
		
		tick = 1; 
		#50; 
		tick = 0;
		
		// 3. Prueba de Pausa
		#10 pause_state = 1;
		#10 pause_state = 0;
		
		// Se activa el tick; la cuenta no debe cambiar
		tick = 1;
		#30; 
		tick = 0;

		// 4. Prueba de Decremento y se cruza por cero
		#10 descendant_state = 1;
		#10 descendant_state = 0;
		
		// Se mantiene el tick activo durante 8 ciclos de reloj para bajar de 5 a -3
		tick = 1;
		#80; 
		tick = 0;

		#20 $finish;
	end
endmodule



