///The function we are implementing is 
/// F(x,y,z) = xyz + x'z


//////Behavioral Modeling///////////////
module SOP_method13(f,x,y,z);
	input x,y,z;
	output reg f;
	
	reg temp1;
	reg temp2;
	reg temp3;	
	
always @(*)
	begin
	temp3 = ~x;
	temp2 = (temp3&z);
	temp1 = x&y&z;
	f = temp1|temp2;
		
	end
endmodule
///////////////////////////////////////////////////////




//////Behavioral Modeling///////////////
module SOP_method1(f,x,y,z);
	input x,y,z;
	output reg f;

	
	always @(x,y,z)  //you can write always @(*)
	begin
		f = (x&y&z)|(~x&z);
	end 
	
endmodule
///////////////////////////////////////////////////////

//////Behavioral Modeling///////////////
module SOP_method1a(f,x,y,z);
	input x,y,z;
	output reg f;
	
	reg temp1;
	reg temp2;
	
	
always @(*)
	begin
		temp1 = x&y&z;
	end 
	
always @(*)
	begin
		temp2 = (~x&z);
	end
	
always @(*)
	begin
		f = temp1|temp2;
	end
endmodule
///////////////////////////////////////////////////////

//////Behavioral Modeling///////////////
module SOP_method1b(f,x,y,z);
	input x,y,z;
	output reg f;
	
		
	
always @(*)
	begin
		if(x==1'b1)
			f = y&z;
		else if(x==1'b0)
			f = z;
		else
			f = 1'b0;
	end 
endmodule
///////////////////////////////////////////////////////
//////Behavioral Modeling///////////////
module SOP_method1c(f,x,y,z);
	input x,y,z;
	output reg f;
	
		
	
always @(*)
	begin
		if({x,y,z} == 3'b111)
			f = 1;
		else if({x,y,z} == 3'b011)
			f = 1;
		else if({x,y,z} == 3'b001)
			f = 1;
		else
			f = 0;
	end 
endmodule
///////////////////////////////////////////////////////










//////Data-flow Modeling///////////////
module SOP_method2(f,x,y,z);
	input x,y,z;
	output wire f;
	
	
	assign f = (x&y&z)|(~x&z);
	
endmodule
////////////////////////////////////////////////////////

//////Data-flow Modeling///////////////
///////////////////////////////////////////////////////
module SOP_method2b(f,x,y,z);
	input x,y,z;
	output wire f;

	
	assign f = (x == 1'b1) ? (y&z) : (z);
	
endmodule
////////////////////////////////////////////////////////

//////Data-flow Modeling///////////////
///////////////////////////////////////////////////////
module SOP_method2a(f,x,y,z);
	input x,y,z;
	output wire f;
	
	wire temp1;
	wire temp2;
	wire temp3;
	
	assign temp1 = ~x;
	assign temp2 = x&y&z;
	assign temp3 = temp1&z;
	assign f = temp2|temp3;	
	
endmodule
////////////////////////////////////////////////////////












//////Gate-level Modeling///////////////
module SOP_method3(f,x,y,z);
	input x,y,z;
	output wire f;
	
	wire temp1;
	wire temp2;
	wire temp3;
	
	not inst1(temp1,x);
	and inst2(temp2,x,y,z);
	and inst3(temp3,temp1,z);
	or  inst4(f,temp2,temp3);
	
endmodule
///////////////////////////////////////////////////////////


//////Gate-level Modeling///////////////
////////////////////////////////////////////////////////
module SOP_method3a(f,x,y,z);
	input x,y,z;
	output wire f;
	
	
	
	or  inst1(f,(x&y&z),(~x&z));
	
endmodule
///////////////////////////////////////////////////////////




//////Combined Gate-level, Data-flow, Behavioral Modeling///////////////
module SOP_method_combined(f,x,y,z);
	input x,y,z;
	output reg f;
	
	wire temp1;
	wire temp2;
	
//Data-flow	
assign temp1 = x&y&z;

//using gate	
and inst1(temp2, ~x, z);

//using behavioral	
always @(*)
	begin
		if(temp1 == 1'b1)
			f = 1'b1;
		else if(temp2 == 1'b1)
			f = 1'b1;
		else 
			f = 1'b0;
	end
endmodule
///////////////////////////////////////////////////////



