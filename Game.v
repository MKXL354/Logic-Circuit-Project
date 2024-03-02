`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:46 01/27/2024 
// Design Name: 
// Module Name:    Game 
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
module Game(
		clk, en, reset, punch1, kick1, wait1, jump1, left1, right1,
		punch2, kick2, wait2, jump2, left2, right2,
		pos11, pos12, pos13, gameOver1, pos21, pos22, pos23, gameOver2,
		SEG_SEL, SEG_DATA
);
		
		input clk, en, reset, punch1, kick1, wait1, jump1, left1, right1;
		input punch2, kick2, wait2, jump2, left2, right2;
		output pos11, pos12, pos13, gameOver1, pos21, pos22, pos23, gameOver2;
		wire [1:0] hp1, hp2;
		output [4:0] SEG_SEL;
		output [7:0] SEG_DATA;
		
		wire clkOut; 
		wire clkOutForSeven; 
		
		freqDivider fd(clk, clkOut);
		freqDividerForSevenSegment fdS(clk, clkOutForSeven);
		
		Logic gameLogic(clkOut, en, reset, punch1, kick1, wait1, jump1, left1, right1,
		punch2, kick2, wait2, jump2, left2, right2,
		hp1, gameOver1, pos11, pos12, pos13, hp2, gameOver2, pos21, pos22, pos23);
		
		SevenSeg ss(clkOutForSeven, hp1, hp2, SEG_SEL, SEG_DATA);
endmodule
