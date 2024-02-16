`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Module Name: SLTI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Create Date: 08.01.2024 17:06:50
// Design Name: 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SLTI(
    input[15:0] rs, // A
    input[15:0] immediate, // mB
    output[15:0] rt // slti
    );
wire lsb;
assign lsb = (rs < immediate) ? 1 : 0;
assign rt = {16'b0, lsb};

endmodule
