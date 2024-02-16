`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:38:38
// Design Name: 
// Module Name: mbledhesi1b
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

module mbledhesi1b(
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
    );
    
assign SUM = CIN ^ A ^ B;
assign COUT = CIN & A | CIN & B | A & B;
    
endmodule

