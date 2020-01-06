/////////////////////////////////////////////////////
//////Using parameters and for loop///////////
module addern_method3(carryin, X, Y, S, carryout);
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output wire [n-1:0] S;
	output wire carryout;
	wire [n:0] C;
	
	assign carryout = C[n];
	assign C[0] = carryin;
	
	genvar k;
	generate
	for (k = 0; k < n; k = k+1)
	begin
		assign  S[k] = X[k] ^ Y[k] ^ C[k];
		assign	C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
	end
	endgenerate
endmodule
/////////////////////////////////////////////////
///////////////////////////////////////////////////


module onebit_full_adder(sum, carryout, x, y, carryin);
	input carryin, x, y;
	output carryout, sum;
		
	assign sum = carryin^(x^y);
	assign carryout = ((x^y)&carryin) | (x&y);	
	
endmodule


//////////////////////////////////////////////////////
//////Using parameters and for loop///////////
module addern_method2(carryin, X, Y, S, carryout);
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output wire [n-1:0] S;
	output wire carryout;
	wire [n:0] C;
	
	assign carryout = C[n];
	assign C[0] = carryin;
	
	genvar k;
	generate
	for (k = 0; k < n; k = k+1)
	begin
		onebit_full_adder inst(S[k], C[k+1], X[k], Y[k], C[k]);
	end
	endgenerate
endmodule
/////////////////////////////////////////////////
///////////////////////////////////////////////////










