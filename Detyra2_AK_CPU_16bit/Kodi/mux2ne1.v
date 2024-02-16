`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:13:15
// Design Name: 
// Module Name: mux2ne1
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


module mux2ne1(
    input Hyrja0,
    input Hyrja1,
    input S,
    output Dalja
    );
    
    assign Dalja = S ? Hyrja1 : Hyrja0;

endmodule
