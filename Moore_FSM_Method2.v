module Moore_FSM_Method2(Clock, Reset, w, z, y);
	input Clock, Reset;
	input w;   ////External input of Moore FSM
	output reg z;   ////Combinational of Moore FSM
	output reg [1:0] y;      ////Present-state of Moore FSM

	reg [1:0] Y;     ////Next-state of Moore FSM
	
	//////State-assignments//////////
	parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10;
 
 	
 	
 	
 	
 	//////////////////////////////////////////////////////
	//// Define the combinational circuits  for next-state
	always @(*)
	begin
		////Combinational circuit for next-state
		case (y)
			A: if (w==1'b1)
				Y = B;
			   else   
				Y = A;
			B: if (w==1'b1)	
				Y = C;
			   else    
				Y = A;
			C: if (w==1'b1)	
				Y = C;
			   else    
				Y = A;
			default: 	
				Y = 2'bxx;
		endcase
    end
    
    
    
    
    
    
    /////////////////////////////////////////
	///Combinational circuit for output
	always @(*)
	begin
		
		case (y)
			A: 
				z = 1'b0;
			B: 
				z = 1'b0;
			C: 
				z = 1'b1;
			default:
				z = 1'bx; 
		endcase				
	end 	


	
	// Define the sequencing element ////Flip-flops//////////	
	always @(posedge Reset, posedge Clock)
	begin
		if (Reset == 1'b1)	
			y <= A;
		else	           
			y <= Y;
	end

	
	 
endmodule
