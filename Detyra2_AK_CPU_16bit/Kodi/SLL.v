`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 22:34:26
// Design Name: 
// Module Name: SLL
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


module SLL(
    input [15:0] A, //rs
    input [3:0] shamt,
    output reg [15:0] SLLResult // rd
    );
      
    integer i ;
    reg [15:0] y ;
    
 always @(A or shamt)
 begin
      //  SLLResult = A << shamt;
   
   // i marim te cilit na mesin kur bojm shift left tani ne 
   // ne fund na mesin qaq hapsira sa kem shty edhe veq i mushim me zero
   
   // assign SLLResult = {A[(15 - shamt):0], {shamt{1'b0}}};
   
       	y = A;
				for (i = shamt; i > 0; i = i - 1) begin
					y = {y[14:0],1'b0};
				end
				SLLResult <= y;
 end
endmodule
