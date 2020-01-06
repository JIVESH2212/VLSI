module Encoder_method1(D,A);
	input [3:0] D;
	output reg [1:0] A;
	
	always @(*)
	begin
		if((D == 4'b1000)||(D == 4'b1001)||(D == 4'b1010)||(D == 4'b1011)||(D == 4'b1100)||(D == 4'b1101)||(D == 4'b1110)||(D == 4'b1111))
			A = 2'b11;
		else if((D == 4'b0100)||(D == 4'b0101)||(D == 4'b0110)||(D == 4'b0111))
			A = 2'b10;
		else if((D == 4'b0010)||(D == 4'b0011))
			A = 2'b01;
		else if(D == 4'b0001)
			A = 2'b00;
		else //default
			A = 2'bxx;		
	
	end 
	
endmodule



module Encoder_method3(D,A);
	input [3:0] D;
	output reg [1:0] A;
	
	always @(*)
	begin
		if(D[3] == 1'b1)
			A = 2'b11;
		else if(D[2] == 1'b1)
			A = 2'b10;
		else if(D[1] == 1'b1)
			A = 2'b01;
		else if(D[0] == 1'b1)
			A = 2'b00;
		else //default
			A = 2'bxx;		
	
	end 
	
endmodule