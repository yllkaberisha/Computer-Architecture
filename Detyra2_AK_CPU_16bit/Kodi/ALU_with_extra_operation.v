`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2024 21:36:09
// Design Name: 
// Module Name: ALU_with_extra_operation
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


module ALU_with_extra_operation(
    input [15:0] A,
    input [15:0] B,
    input [3:0] ALUOp,
    input [3:0] shamt,
    output Zero,
    output Overflow,
    output CarryOut,
    output [15:0] Result
    );
    
    wire [15:0] ALU16_Result ;
    wire [15:0] SLTI_Result ;
    wire [15:0] SLL_Result ;
    wire [15:0] SRA_Result ;

    //               (BNegate), (tre bita per me tregu operacionin),
    ALU_16 ALU16( A, B, ALUOp[3], ALUOp[2:0], Zero, Overflow, CarryOut, ALU16_Result);
    
    SLTI sltifunction(A, B, SLTI_Result);
    SLL sllfunction(A, shamt, SLL_Result);
    SRA srafunction(A, shamt, SRA_Result);
    
    
    mux4ne1 muxResult(ALU16_Result,SLTI_Result, SLL_Result,SRA_Result,ALUOp, Result);
endmodule
