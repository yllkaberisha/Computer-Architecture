`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 15:40:53
// Design Name: 
// Module Name: ControlUnit_Test
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


module ControlUnit_Test();

    reg [3:0] Opcode;
    wire RegDst;
    wire MemToReg;
    wire MemWrite;
    wire Branch;
    wire MemRead;
    wire [1:0] ALUOP;
    wire ALUSrc;
    wire RegWrite;
    
initial
    $monitor("Opcode = %b; RegDst = %b; ALUSrc = %b; MemToReg = %b; RegWrite = %b; MemRead = %b; MemWrite = %b; ALUOp = %b; Branch = %b",
        Opcode, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, ALUOP, Branch);

    initial 
    begin
    #0 Opcode= 4'b0000;
    #5 Opcode= 4'b0001;
    #5 Opcode= 4'b1001;
    #5 Opcode= 4'b1010;
    #5 Opcode= 4'b1011;
    #5 Opcode= 4'b1100;
    #5 Opcode= 4'b1101;
    #5 Opcode= 4'b1111;
    #5 Opcode= 4'b0010;

    #5 $stop;
    end
    
  //  ControlUnit CU ( Opcode, RegDst,MemToReg,MemWrite, Branch,MemRead,ALUOp,ALUSrc,RegWrite);
   ControlUnit CU (
        .Opcode(Opcode),
        .RegDst(RegDst),
        .MemToReg(MemToReg),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .MemRead(MemRead),
        .ALUOp(ALUOP),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

endmodule
