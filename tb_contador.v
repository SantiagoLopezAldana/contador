`timescale 1ns/1ps

module tb_contador;	
	reg clk;
	reg tick;
	reg rst;
	reg pause_state;
	reg descendant_state;
	reg ascendant_state;
	wire [8:0] cuenta;
	contador DUT (.clk(clk), .tick(tick), .rst(rst), .pause_state(pause_state), .descendant_state(descendant_state), .ascendant_state(ascendant_state), .cuenta(cuenta));
	initial begin
		$monitor("rst=%b pause_state=%b descendant_state=%b ascendant_state=%b cuenta=%d", rst, pause_state, descendant_state, ascendant_state, cuenta);
		//reset
		clk = 1; tick = 1; pause_state = 0; rst = 1; descendant_state = 1; ascendant_state = 0; #10;
		clk = 0; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 1; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 0; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 1; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 0; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 1; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 0; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 1; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		clk = 0; tick = 1; pause_state = 0; rst = 0; descendant_state = 1; ascendant_state = 0; #10;
		//Incremento y tick
		//Decremento y tick
		$finish;
	end
endmodule


