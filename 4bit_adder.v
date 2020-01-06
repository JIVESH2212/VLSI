///////////////////////////////////////////////////////////////
module onebit_full_adder(sum, carryout, x, y, carryin);
	input carryin, x, y;
	output carryout, sum;
		
	assign sum = carryin^(x^y);
	assign carryout = ((x^y)&carryin) | (x&y);	
	
endmodule

//////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
module fourbit_adder_method1(Sum, carryout, A, B, cin);
	input cin;
	input [3:0] A;
	input [3:0] B;
	output wire [3:0] Sum;
	output wire carryout;
	
	wire [2:0] temp_carryout;
	
	onebit_full_adder inst1(Sum[0], temp_carryout[0], A[0], B[0],cin);	
	onebit_full_adder inst2(Sum[1], temp_carryout[1], A[1], B[1],temp_carryout[0]);	
	onebit_full_adder inst3(Sum[2], temp_carryout[2], A[2], B[2],temp_carryout[1]);	
	onebit_full_adder inst4(Sum[3],carryout, A[3], B[3],temp_carryout[2]);	
 			
endmodule

///////////////////////////////////////////////////////////////
module fourbit_adder_method2(Sum, carryout, A, B, cin);
	input cin;
	input [3:0] A;
	input [3:0] B;
	output reg [3:0] Sum;
	output reg carryout;
	
	always @(*)
	begin
		{carryout, Sum} = A + B + cin;
	end
 			
endmodule
