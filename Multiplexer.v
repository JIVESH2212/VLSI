/////////Behavioral Modeling//////
module Multiplexer_method1(f, inp, s);
	input [2:0] s;
	input [7:0] inp;
	output reg f;
	
	always @(*)
	begin
		///Using if-else statements
		if(s == 3'b000)
			f = inp[0];
		else if(s == 3'b001)
			f = inp[1];
		else if(s == 3'b010)
			f = inp[2];
		else if(s == 3'b011)
			f = inp[3];
		else if(s == 3'b100)
			f = inp[4];
		else if(s == 3'b101)
			f = inp[5];
		else if(s == 3'b110)
			f = inp[6];
		else if(s == 3'b111)
			f = inp[7];
		else //default
			f = 1'bx;
		
	
	end 
	
endmodule
////////////////////////////////////////////////////////

/////////Behavioral Modeling//////
module Multiplexer_method2(f, inp, s);
	input [2:0] s;
	input [7:0] inp;
	output reg f;
	
	always @(*)
	begin
		//Using case statement
		case(s)
		3'b000:
			f = inp[0];
		3'b001:
			f = inp[1];
		3'b010:
			f = inp[2];
		3'b011:
			f = inp[3];
		3'b100:
			f = inp[4];
		3'b101:
			f = inp[5];
		3'b110:
			f = inp[6];
		3'b111:
			f = inp[7];
		default:
			f = 1'bx;
		endcase
	end 
	
endmodule
////////////////////////////////////////////////////////

/////////Behavioral Modeling//////
module Multiplexer_method5(f, inp, s);
	input [2:0] s;
	input [7:0] inp;
	output f;
	reg f;
	
	
	always @(*)
	begin
		f = (s == 3'b000) ? inp[0]:((s == 3'b001) ? (inp[1]):((s == 3'b010) ? (inp[2]):((s == 3'b011) ? (inp[3]):((s == 3'b100) ? (inp[4]):((s == 3'b101) ? (inp[5]):((s == 3'b110) ? (inp[6]): (inp[7])))))));
	end
		
endmodule






/////////Data-flow Modeling//////
module Multiplexer_method3(f, inp, s);
	input [2:0] s;
	input [7:0] inp;
	output f;
	wire f;
	wire temp0;
	wire temp1;
	wire temp2;	
	wire temp3;	
	wire temp4;	
	wire temp5;	
	wire temp6;
	wire temp7;

	assign temp0 = (inp[0])&(~s[2])&(~s[1])&(~s[0]);
	assign temp1 = (inp[1])&(~s[2])&(~s[1])&(s[0]);
	assign temp2 = (inp[2])&(~s[2])&(s[1])&(~s[0]);
	assign temp3 = (inp[3])&(~s[2])&(s[1])&(s[0]);
	assign temp4 = (inp[4])&(s[2])&(~s[1])&(~s[0]);
	assign temp5 = (inp[5])&(s[2])&(~s[1])&(s[0]);
	assign temp6 = (inp[6])&(s[2])&(s[1])&(~s[0]);
	assign temp7 = (inp[7])&(s[2])&(s[1])&(s[0]);

	assign f = temp0|temp1|temp2|temp3|temp4|temp5|temp6|temp7;   
	
endmodule


/////////Gate-level Modeling//////
module Multiplexer_method4(f, inp, s);
	input [2:0] s;
	input [7:0] inp;
	output f;
	wire f;
	
	
	bufif1 inst1(f,inp[0],(~s[2])&(~s[1])&(~s[0]));
	bufif1 inst2(f,inp[1],(~s[2])&(~s[1])&(s[0]));
	bufif1 inst3(f,inp[2],(~s[2])&(s[1])&(~s[0]));
	bufif1 inst4(f,inp[3],(~s[2])&(s[1])&(s[0]));
	bufif1 inst5(f,inp[4],(s[2])&(~s[1])&(~s[0]));
	bufif1 inst6(f,inp[5],(s[2])&(~s[1])&(s[0]));
	bufif1 inst7(f,inp[6],(s[2])&(s[1])&(~s[0]));
	bufif1 inst8(f,inp[7],(s[2])&(s[1])&(s[0]));
		
endmodule


