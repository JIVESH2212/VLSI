module comp_method1(A,B, AgB, BgA, AeB);
	input [3:0] A, B;
	output wire AgB, BgA, AeB;
	
	assign AgB = A>B;
	assign BgA = B>A;
	assign AeB = A==B;
	
	///
	//assign AgB = (A>B)? 1 : 0;
	//assign BgA = (B>A)? 1 : 0;
	//assign AeB = (A==B)? 1 : 0;

		
endmodule

///////////////////////////////////////////////
module comp_method2(A,B, AgB, BgA, AeB);
	input [3:0] A, B;
	output reg AgB, BgA, AeB;
	
	always @(A,B)
	begin
		AgB = A>B;
		BgA = B>A;
		AeB = A==B;
	end
		
endmodule

