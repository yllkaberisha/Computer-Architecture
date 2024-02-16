`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2024 21:09:36
// Design Name: 
// Module Name: mux2ne1_2bit
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


module mux2ne1_2bit(
    input[1:0] Hyrja0,
    input[1:0] Hyrja1,
    input S,
    output[1:0] Dalja
    );
    
assign Dalja = S ? Hyrja1 : Hyrja0;

endmodule
