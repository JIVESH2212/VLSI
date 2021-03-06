module Encoder_method1(D,A);
	input [15:0] D;
	output reg [3:0] A;
	
	always @(D)
	begin
		if(D == 16'b0000_0000_0000_0001)
			A = 4'b0000;
		else if(D == 16'b0000_0000_0000_0010)
			A = 4'b0001;
		else if(D == 16'b0000_0000_0000_0100)
			A = 4'b0010;
		else if(D == 16'b0000_0000_0000_1000)
			A = 4'b0011;
		else if(D == 16'b0000_0000_0001_0000)
			A = 4'b0100;
		else if(D == 16'b0000_0000_0010_0000)
			A = 4'b0101;
		else if(D == 16'b0000_0000_0100_0000)
			A = 4'b0110;
		else if(D == 16'b0000_0000_1000_0000)
			A = 4'b0111;
		else if(D == 16'b0000_0001_0000_0000)
			A = 4'b1000;
		else if(D == 16'b0000_0010_0000_0000)
			A = 4'b1001;
		else if(D == 16'b0000_0100_0000_0000)
			A = 4'b1010;
		else if(D == 16'b0000_1000_0000_0000)
			A = 4'b1011;
		else if(D == 16'b0001_0000_0000_0000)
			A = 4'b1100;
		else if(D == 16'b0010_0000_0000_0000)
			A = 4'b1101;
		else if(D == 16'b0100_0000_0000_0000)
			A = 4'b1110;
		else if(D == 16'b1000_0000_0000_0000)
			A = 4'b1111;
		else //default
			A = 4'bxxxx;		
	
	end 
	
endmodule

///////////////////////////////////////////////////////
module Encoder_method2(f,A);
	input [15:0] f;
	output reg [3:0] A;
	
	always @(f)
	begin
		case(f)
		16'b0000_0000_0000_0001: 	
			A = 4'b0000;
		16'b0000_0000_0000_0010: 
			A = 4'b0001;
		16'b0000_0000_0000_0100:
			A = 4'b0010;
		16'b0000_0000_0000_1000:
			A = 4'b0011;
		16'b0000_0000_0001_0000:
			A = 4'b0100;
		16'b0000_0000_0010_0000:
			A = 4'b0101;
		16'b0000_0000_0100_0000:
			A = 4'b0110;
		16'b0000_0000_1000_0000:
			A = 4'b0111;
		16'b0000_0001_0000_0000:
			A = 4'b1000;
		16'b0000_0010_0000_0000:
			A = 4'b1001;
		16'b0000_0100_0000_0000:
			A = 4'b1010;
		16'b0000_1000_0000_0000:
			A = 4'b1011;
		16'b0001_0000_0000_0000:
			A = 4'b1100;
		16'b0010_0000_0000_0000:
			A = 4'b1101;
		16'b0100_0000_0000_0000:
			A = 4'b1110;
		16'b1000_0000_0000_0000:
			A = 4'b1111;
		default:
			A = 4'bxxxx;
	
		endcase

	end 
	
endmodule

