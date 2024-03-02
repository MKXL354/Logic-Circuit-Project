`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:22 01/27/2024 
// Design Name: 
// Module Name:    freqDivider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module freqDivider (clkIn, clkOut);
	input clkIn;
	output clkOut;
	reg clkOut;
	reg[25:0] counter=0;
	always @ (posedge clkIn)
	begin
		if(counter == 30000000-1)
		begin
			counter <= 0;
			clkOut <= ~clkOut;
		end
		else
		begin
			counter <= counter+1;
		end
	end

endmodule
