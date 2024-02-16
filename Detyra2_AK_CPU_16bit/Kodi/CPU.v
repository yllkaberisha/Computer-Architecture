`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2024 00:25:48
// Design Name: 
// Module Name: CPU
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


module CPU(input Clock);

reg[15:0] PC;
wire[15:0] Instruction;
wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch;
wire[1:0] ALUOp;
wire[15:0] pc_next;

initial
begin
    assign PC =16'd10;  //inicializimi fillesar i PC ne adresen 10
end 

 InstructionMemory IM(PC, Instruction);
 
 ControlUnit CU(
 Instruction[15:12],   //   opcode  
 RegDst,
 MemToReg,
 MemWrite, 
 Branch,
 MemRead,
 ALUOp,
 ALUSrc,
 RegWrite );
  
 DataPath DP (Clock,PC, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, 
 ALUOp, Instruction, pc_next);


always@(posedge Clock)
begin
    PC <= pc_next; //azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
    
end
endmodule
