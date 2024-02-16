`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2024 02:16:22
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
input wire[15:0] PCAddress,
output wire[15:0] Instruction);

reg[7:0] instrMem[127:0];  // [7:0] 8 bit me 128 rreshta

initial $readmemh("InstructionMemory.mem", instrMem);


assign Instruction = {instrMem[PCAddress] , instrMem[PCAddress + 1]};

endmodule
