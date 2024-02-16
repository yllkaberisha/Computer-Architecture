`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 21:04:42
// Design Name: 
// Module Name: mux8ne1
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


module mux8ne1(
    input input0,
    input input1,
    input input2,
    input input3,
    input input4,
    input [2:0] S,
    output dalja
    );
    
//S 000 H0
//S 001 H1
//S 010 H2
//S 011 H3
//S 100 H4

    assign dalja = S[2] ? (input4) : (S[1] ? (S[0] ? input3 : input2 ) : (S[0] ? input1 : input0 ));
    
endmodule
