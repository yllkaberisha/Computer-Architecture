`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 22:15:25
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [3:0] Opcode,
    output reg RegDst,
    output reg MemToReg,
    output reg MemWrite, 
    output reg Branch,
    output reg MemRead,
    output reg [1:0] ALUOp,
    output reg ALUSrc,
    output reg RegWrite
    );
    
    
always @(Opcode)
begin
case(Opcode)

4'b0000:
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                      //AND OR XOR
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
end

4'b0001:
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                      //ADD SUB
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
end 


4'b1001:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                    //ADDI
assign MemWrite = 1'b0;
assign ALUOp = 2'b11;
assign Branch = 1'b0;
end

4'b1010:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                    //SUBI
assign MemWrite = 1'b0;
assign ALUOp = 2'b11;
assign Branch = 1'b0;
end 

4'b1011:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                    //SLTI
assign MemWrite = 1'b0;
assign ALUOp = 2'b11;
assign Branch = 1'b0;
end 

4'b1100:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b1;
assign RegWrite = 1'b1;
assign MemRead = 1'b1;                   //LW
assign MemWrite = 1'b0;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
end

4'b1101:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;                   //SW
assign MemWrite = 1'b1;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
end


4'b1111:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;                  //BEQ
assign MemWrite = 1'b0;
assign ALUOp = 2'b01;
assign Branch = 1'b1;
end

4'b0010:
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'bX;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;                 //SLL SRA
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
end 


endcase
end
endmodule
