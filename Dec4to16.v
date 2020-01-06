module dec_1to2(A,E,D);
	input A,E;
	output wire [1:0] D;
	
	assign D[0] = ~A&E;
	assign D[1] = A&E;
			
endmodule
////////////////////////////////////////

module dec_2to4(A,E,D);
	input [1:0] A;
	input E;
	output wire [3:0] D;
	
	wire temp1, temp2;

	dec_1to2 inst1(A[0],temp1,D[1:0]);
	dec_1to2 inst2(A[0],temp2,D[3:2]);
	
	assign temp1 = ~A[1]&E;
	assign temp2 = A[1]&E;
	
			
endmodule
////////////////////////////////////////

module dec_3to8(A,E,D);
	input [2:0] A;
	input E;
	output wire [7:0] D;
	
	wire temp1, temp2;

	dec_2to4 inst1(A[1:0],temp1,D[3:0]);
	dec_2to4 inst2(A[1:0],temp2,D[7:4]);
	
	assign temp1 = ~A[2]&E;
	assign temp2 = A[2]&E;
	
			
endmodule
////////////////////////////////////////







module dec_4to16(A,E,D);
	input [3:0] A;
	input E;
	output wire [15:0] D;
	
	wire temp1, temp2;

	dec_3to8 inst1(A[2:0],temp1,D[7:0]);
	dec_3to8 inst2(A[2:0],temp2,D[15:8]);
	
	assign temp1 = ~A[3]&E;
	assign temp2 = A[3]&E;
	
		
endmodule

