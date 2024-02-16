`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 13:55:47
// Design Name: 
// Module Name: ALU1_Test
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


module ALU1_Test();

reg A, B, CIN, BInvert, Less;
reg [2:0] Operation;
wire Result, COUT;

initial
$monitor("A=%b, B=%b, CIN=%b, BInvert=%b, Less=%b, Operation=%b, Result=%b, COUT=%b",A, B, CIN, BInvert, Less, Operation, Result, COUT);

initial
begin

#0 A=1'b0;B=1'b0; CIN=1'b0; BInvert=1'b0; Less =1'b0 ;Operation=3'b000; // and
#10 A=1'b1;B=1'b0; CIN=1'b0; BInvert=1'b0; Less =1'b0 ;Operation=3'b010; // or
#10 A=1'b0;B=1'b1; CIN=1'b0; BInvert=1'b0;Less =1'b0; Operation=3'b011;  // xor
#10 A=1'b1;B=1'b1; CIN=1'b0; BInvert=1'b0;Less =1'b0;Operation=3'b000;  //and


//ADD
#10 A=1'b0;B=1'b0; CIN=1'b0; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b0;B=1'b1; CIN=1'b0; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b1;B=1'b0; CIN=1'b0; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b1;B=1'b1; CIN=1'b0; BInvert=1'b0; Less =1'b0; Operation=3'b100;
                                                                      
#10 A=1'b0;B=1'b0; CIN=1'b1; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b1;B=1'b0; CIN=1'b1; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b0;B=1'b1; CIN=1'b1; BInvert=1'b0; Less =1'b0; Operation=3'b100;
#10 A=1'b1;B=1'b1; CIN=1'b1; BInvert=1'b0; Less =1'b0; Operation=3'b100;

#10 $stop;

end
ALU1 ALU1_Test(A,B,CIN,BInvert,Less,Operation,Result,COUT);
endmodule
