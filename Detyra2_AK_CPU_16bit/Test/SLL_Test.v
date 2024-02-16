`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 20:45:32
// Design Name: 
// Module Name: SLL_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module SLL_Test();

  reg [15:0] A;
  reg [3:0] shamt;
  wire [15:0] SLLResult;
  
    initial
      $monitor("A = %b; shamt = %b; SLLResult = %b", A, shamt, SLLResult);


    initial 
    begin
      #0 A = 16'b00001111; shamt = 4'd1;
      #5 A = 16'b10001110; shamt = 4'd1;
      #5 A = 16'b01101111; shamt = 4'd1;
      #5 A = 16'b01101111; shamt = 4'd2;
      #5 A = 16'b11111110; shamt = 4'd1;
      #5 A = 16'b10001110; shamt = 4'd2;
      #5 A = 16'b10001110; shamt = 4'd3;
      #5 A = 16'b0000000000000010; shamt = 4'b0010;

      #5 $stop;
    end
 
  SLL sll(
    .A(A),
    .shamt(shamt),
    .SLLResult(SLLResult)
  );
endmodule
