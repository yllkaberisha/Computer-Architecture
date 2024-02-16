`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2024 15:51:08
// Design Name: 
// Module Name: ALUControl_Test
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


module ALUControl_Test();
   reg [1:0] ALUOp;
   reg [1:0] Funct;
   reg [3:0] Opcode;
   wire [3:0] ALUCtrl;
   
    initial
        $monitor("ALUOp = %b; Funct = %b; Opcode = %b; ALUCtrl = %b", ALUOp, Funct, Opcode, ALUCtrl);

    initial
        begin
                #0 ALUOp = 2'b00;
                #5 ALUOp = 2'b01;                 
        
                #5 ALUOp = 2'b10; Opcode =4'b0000; Funct = 2'b00;
                #5 ALUOp = 2'b10; Opcode =4'b0000; Funct = 2'b01;
                #5 ALUOp = 2'b10; Opcode =4'b0000; Funct = 2'b10;
                              
                #5 ALUOp = 2'b10; Opcode =4'b0001; Funct = 2'b00;
                #5 ALUOp = 2'b10; Opcode =4'b0001; Funct = 2'b01;
                              
                #5 ALUOp = 2'b10; Opcode =4'b0010; Funct = 2'b00;
                #5 ALUOp = 2'b10; Opcode =4'b0010; Funct = 2'b01;
                
                #5 ALUOp = 2'b11; Opcode =4'b1001;  Funct = 2'bXX;
                #5 ALUOp = 2'b11; Opcode =4'b1010; 
                #5 ALUOp = 2'b11; Opcode =4'b1011; 


                #5 $stop;
        end
   
    ALUControl aluCon (
        .ALUOp(ALUOp),
        .Funct(Funct),
        .Opcode(Opcode),
        .ALUCtrl(ALUCtrl)
    );
endmodule
