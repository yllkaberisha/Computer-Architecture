`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 23:43:25
// Design Name: 
// Module Name: SRA_Test
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


module SRA_Test();

  reg [15:0] A;
  reg [3:0] shamt;
  wire [15:0] SRAResult;

    initial
      $monitor("A = %b; shamt = %b; SRAResult = %b", A, shamt, SRAResult);


    initial 
    begin
      #0 A = 16'b00001111; shamt = 4'd1;
      #5 A = 16'b1000111010001110; shamt = 4'd1;
      #5 A = 16'b01101111; shamt = 4'd1;
      #5 A = 16'b01101111; shamt = 4'd2;
      #5 A = 16'b11111110; shamt = 4'd1;
      #5 A = 16'b10001110; shamt = 4'd2;
      #5 A = 16'b10001110; shamt = 4'd3;
      #5 A = 16'b1000000000000010; shamt = 4'b0001;
      #5 $stop;
    end
 
  SRA sra(
    .A(A),
    .shamt(shamt),
    .SRAResult(SRAResult)
  );
endmodule
