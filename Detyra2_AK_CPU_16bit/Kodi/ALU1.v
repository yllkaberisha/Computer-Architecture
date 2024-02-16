`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:45:39
// Design Name: 
// Module Name: ALU1
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


module ALU1(
    input A,
    input B,
    input CIN,
    input BInvert,
    input Less,
    input [2:0] Operation,
    output Result,
    output COUT
    );
    
   wire  JoB, mB, dhe_teli, ose_teli, mbledhesi_teli, xor_teli; 
   
  
   assign JoB = ~B;
   
   mux2ne1 muxB(B, JoB, BInvert, mB);
   
   assign dhe_teli = A & mB;
   assign ose_teli = A | mB;
   assign xor_teli = A ^ mB;
   
   mbledhesi1b m1(A, mB, CIN, mbledhesi_teli, COUT);
   
   mux8ne1 MuxiKryesor(dhe_teli, Less, ose_teli, xor_teli, mbledhesi_teli, Operation, Result);
    
   
endmodule
