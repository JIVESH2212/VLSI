/////////////////////////////////////////
//////D-LATCH ///////////////////////
module D_latch(clk, D, Q, Q_bar); 
input clk, D;
output Q, Q_bar;
reg Q;
wire Q_bar;

always @(clk, D)
	begin
		if (clk==1'b1)
				Q=D;			
			
	end
	
assign Q_bar = ~Q;	

endmodule
/////////////////////////////////////////////////////////////////



/////////////////////////////////////////
//////D-FF ///////////////////////
module D_FF(clk, D, Q, Q_bar);
input clk, D;
output Q, Q_bar;
reg Q;
wire Q_bar;
always @(posedge clk)
	begin
			Q<=D;
	end
	
assign Q_bar = ~Q;
endmodule
/////////////////////////////////////////////////////////////////////





        
/////DONOT USE THIS METHOD FOR CODING D-FF/////////////////////
////Because the always block is not trigerred on edge//////////
module D_FF_usingif(clk, D, Q, Q_bar); 
input clk, D;
output Q, Q_bar;
reg Q;
wire Q_bar;

always @(clk)
	begin
		if (clk==1'b1)
				Q=D;			
			
	end
	
assign Q_bar = ~Q;	

endmodule
/////////////////////////////////////////////////////////////////




/////////////////////////////////////////
//////D-LATCH made from master-slave D-Latches///////////////////////
module D_FF_from_latch(clk, D, Q, Q_bar);
input clk, D;
output Q, Q_bar;
wire Q, Q_bar;
wire Q_inter, Q_bar_inter;
wire clk_bar;

D_latch master(clk_bar, D, Q_inter, Q_bar_inter);
D_latch slave(clk, Q_inter, Q, Q_bar);

assign clk_bar = ~clk;

endmodule 