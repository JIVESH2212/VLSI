module Clock_tb();

reg clk, clk1;


initial
begin
	#2000 $finish;
end



////////Method 1////////////////
initial
begin
	#50 clk = 1'b0; 
end

always @(*)
begin
	#50 clk = ~clk; 
end
/////////////////////////////////


//////////Method 2//////////////
always
begin
	#50 clk1 = 1'b0;
	#50 clk1 = 1'b1;
end
//////////////////////////////




//////////Method 3//////////////

wire out1;
reg inpE;

nand #(50) inst1(out1, out1, inpE);

initial
begin

	inpE = 1'b0;
	#100 inpE = 1'b1;
end
//////////////////////////////

endmodule