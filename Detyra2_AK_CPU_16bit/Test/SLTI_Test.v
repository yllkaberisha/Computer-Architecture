`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 21:12:13
// Design Name: 
// Module Name: SLTI_Test
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



module SLTI_Test();
    reg[15:0] rs; // A
    reg[15:0] immediate; // mB
    wire[15:0] rt; // slti

    initial
      $monitor("A(rs) = %b; immediate = %b; rt = %b", rs, immediate, rt);


    initial 
    begin
      #0 rs = 16'd10 ; immediate = 16'd10;
      #5 rs = 16'd10 ; immediate = 16'd1;
      #5 rs = 16'd10 ; immediate = 16'd11;
      #5 rs = 16'd10 ; immediate = 16'd5;
      #5 rs=16'b00; immediate=16'b01;

      #5 $stop;
    end
 
  SLTI slti(
    .rs(rs),
    .immediate(immediate),
    .rt(rt)
  );
endmodule
