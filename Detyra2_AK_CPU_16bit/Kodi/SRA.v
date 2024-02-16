`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2024 23:20:35
// Design Name: 
// Module Name: SRA
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


//module SRA #(parameter test = 0)(
//    input [15:0] A,
//    input [3:0] shamt,
//    output reg [15:0] SRAResult
//    );

////     reg [3:0] shamt_value = test + shamt;

// always @(A or shamt)
// begin
////            shamt_value = test + shamt;
 

//     assign SRAResult = {{shamt_value{A[15]}}, A[15:shamt_value]};
// end

//endmodule

module SRA(
    input [15:0] A,  //rs
    input [3:0] shamt,
    output reg [15:0] SRAResult  //rd
    );

    integer i ;
    reg [15:0] y ;

 always @(A or shamt)
 begin 
      // assign SRAResult = A >>> shamt;
     // assign SRAResult = {{shamt{A[15]}}, A[15:shamt]};
     
     	y = A;
				for (i = shamt; i > 0; i = i - 1) begin
					y = {y[15],y[15:1]};
				end
				SRAResult <= y;
 end

endmodule



