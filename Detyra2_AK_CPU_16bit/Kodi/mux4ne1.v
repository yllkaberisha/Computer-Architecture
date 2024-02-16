`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:23:35
// Design Name: 
// Module Name: mux4ne1
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


module mux4ne1(
    input [15:0] Hyrja0,
    input [15:0] Hyrja1,
    input [15:0] Hyrja2,
    input [15:0] Hyrja3,
    input [3:0] ALUOp,
    output reg [15:0] Dalja
    );
    
    
    always @(ALUOp)      
begin
  case(ALUOp)
      4'b0001: Dalja = Hyrja1;   // SLTI
      4'b0110: Dalja = Hyrja2;   // SLL
      4'b0111: Dalja = Hyrja3;   // SRA
      default: Dalja = Hyrja0;   // ALU16
  endcase
end
    
endmodule