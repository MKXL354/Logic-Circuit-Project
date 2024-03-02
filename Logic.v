`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:06 01/27/2024 
// Design Name: 
// Module Name:    Logic 
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
module Logic(
		clk, en, reset, punch1, kick1, wait1, jump1, left1, right1,
		punch2, kick2, wait2, jump2, left2, right2,
		hp1, gameOver1, pos11, pos12, pos13, hp2, gameOver2, pos21, pos22, pos23
);
		
		input clk, en, reset, punch1, kick1, wait1, jump1, left1, right1;
		input punch2, kick2, wait2, jump2, left2, right2;
		output pos11, pos12, pos13, gameOver1, pos21, pos22, pos23, gameOver2;
		output [1:0] hp1, hp2;
		reg rest1, gameOver1, rest2, gameOver2;
		reg [1:0] hp1, pos1, hp2, pos2;
		
	initial
	begin
		rest1=0;
		rest2=0;
		pos1=3;
		pos2=3;
		hp1=3;
		hp2=3;
		gameOver1=0;
		gameOver2=0;
	end
	
	assign pos13 = pos1[1] & pos1[0];
	assign pos12 = pos1[1] & !pos1[0];
	assign pos11 = !pos1[1] & pos1[0];
	
	assign pos23 = pos2[1] & pos2[0];
	assign pos22 = pos2[1] & !pos2[0];
	assign pos21 = !pos2[1] & pos2[0];
	
	always @ (posedge clk) begin
		//reset
		if(reset)
		begin
			rest1=0;
			rest2=0;
			pos1=3;
			pos2=3;
			hp1=3;
			hp2=3;
			gameOver1=0;
			gameOver2=0;
		end
		
		if(en && !gameOver1 && !gameOver2) begin
			//movement
			if(left1 && pos1<3) pos1 = pos1 + 1;
			if(left2 && pos2>1) pos2 = pos2 - 1;
			if(right1 && pos1>1) pos1 = pos1- 1;
			if(right2 && pos2<3) pos2 = pos2+ 1;
			
			//reset rest
			if(!wait1) rest1=0;
			if(!wait2) rest2=0;
			
			//wait and regen
			if(wait1 && !rest1) rest1 = 1;
			else if(wait1)
				begin
					rest1 = 0;
					hp1 = hp1!=3 ? hp1+1 : hp1;
				end
				
			if(wait2 && !rest2) rest2 = 1;
			else if(wait2)
				begin
					rest2 = 0;
					hp2 = hp2!=3 ? hp2+1 : hp2;
				end
			
			//punch
			if(pos1==1 && pos2==1)
			begin
				if(punch1 && punch2)
				begin
					pos1 = 2;
					pos2 = 2;
				end
				else if(punch1 && !jump2) hp2 = hp2==3 ? 1 : 0;
				else if(punch2 && !jump1) hp1 = hp1==3 ? 1 : 0;
				
				else if(kick1 && !jump2) hp2 = hp2!=0 ? hp2-1 : 0;
				else if(kick2 && !jump1) hp1 = hp1!=0 ? hp1-1 : 0;
			end
			
			//kick
			if(pos1==2 && pos2==1 || pos1==1 && pos2==2)
			begin
				if(kick1 && kick2)
				begin
					pos1 = pos1+1;
					pos2 = pos2+1;
				end
				else if(kick1 && !jump2) hp2 = hp2!=0 ? hp2-1 : 0;
				else if(kick2 && !jump1) hp1 = hp1!=0 ? hp1-1 : 0;
			end
		
			if(hp1==0) gameOver1=1;
			if(hp2==0) gameOver2=1;
		end
	end
endmodule