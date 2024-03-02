`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:11 01/25/2024
// Design Name:   Game
// Module Name:   C:/Users/asys/Documents/Logical Lab Reports/FinalProj/TestBenchTest.v
// Project Name:  FinalProj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Game
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBenchTest;

	// Inputs
	reg clk;
	reg en;
	reg reset;
	reg punch1;
	reg kick1;
	reg wait1;
	reg jump1;
	reg left1;
	reg right1;
	reg punch2;
	reg kick2;
	reg wait2;
	reg jump2;
	reg left2;
	reg right2;

	// Outputs
	wire [1:0] hp1;
	wire pos11;
	wire pos12;
	wire pos13;
	wire [1:0] hp2;
	wire pos21;
	wire pos22;
	wire pos23;

	// Instantiate the Unit Under Test (UUT)
	Logic uut (
		.clk(clk), 
		.en(en), 
		.reset(reset), 
		.punch1(punch1), 
		.kick1(kick1), 
		.wait1(wait1), 
		.jump1(jump1), 
		.left1(left1), 
		.right1(right1), 
		.punch2(punch2), 
		.kick2(kick2), 
		.wait2(wait2), 
		.jump2(jump2), 
		.left2(left2), 
		.right2(right2), 
		.hp1(hp1), 
		.pos11(pos11), 
		.pos12(pos12), 
		.pos13(pos13), 
		.hp2(hp2), 
		.pos21(pos21), 
		.pos22(pos22), 
		.pos23(pos23)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		en = 1;
		reset = 0;
		punch1 = 0;
		kick1 = 0;
		wait1 = 0;
		jump1 = 0;
		left1 = 0;
		right1 = 0;
		punch2 = 0;
		kick2 = 0;
		wait2 = 0;
		jump2 = 0;
		left2 = 0;
		right2 = 0;
		
		
		right1=1;
		left2=1;
		#5
		right1=0;
		left2=0;
		
		#40
		right1=1;
		left2=1;
		#10
		right1=0;
		left2=0;
		
		#40
		punch1=1;
		jump2=1;
		#10
		punch1=0;
		jump2=0;
		
		#40
		punch1=1;
		kick2=1;
		#10
		punch1=0;
		kick2=0;
		
		#40
		punch1=1;
		punch2=1;
		#10
		punch1=0;
		punch2=0;
		
		#40
		right1=1;
		wait2=1;
		#10
		right1=0;
		wait2=0;
		
		#40
		jump1=1;
		wait2=1;
		#10
		jump1=0;
		wait2=0;
		
		#40
		punch1=1;
		kick2=1;
		#10
		punch1=0;
		kick2=0;
		
		#40
		kick1=1;
		jump2=1;
		#10
		kick1=0;
		jump2=0;
		
		#40
		left1=1;
		kick2=1;
		#10
		left1=0;
		kick2=0;
		
		#40
		kick1=1;
		left2=1;
		#10
		kick1=0;
		left2=0;
	end
	
	initial begin
		clk=1'b1;
		repeat(100)
		#25 clk=~clk;
	end
      
endmodule

