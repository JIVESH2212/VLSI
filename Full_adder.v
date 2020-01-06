//////Behavioral Modeling//////////////////////
module Full_adder_method1(sum, carryout, x, y, carryin);
	input carryin, x, y;
	output carryout, sum;
	reg carryout, sum;

	always @(*)
	begin
		sum = carryin^(x^y);
		carryout = ((x^y)&carryin) | (x&y);	
	end 
	
endmodule
///////////////////////////////////////////////////////////////

//////Behavioral Modeling/////////////////
module Full_adder_method3(sum, carryout, x, y, carryin);
	input carryin, x, y;
	output carryout, sum;
	reg carryout, sum;

	always @(*)
	begin
		{carryout, sum} = x + y + carryin;	
	end 
	
endmodule
///////////////////////////////////////////////////////////////






//////Data-flow Modeling////////
module Full_adder_method2(sum, carryout, x, y, carryin);
	input carryin, x, y;
	output carryout, sum;
		
	assign sum = carryin^(x^y);
	assign carryout = ((x^y)&carryin) | (x&y);	
	
endmodule
///////////////////////////////////////////////////////////////////
