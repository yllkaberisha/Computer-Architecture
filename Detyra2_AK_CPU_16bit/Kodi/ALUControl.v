`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2024 22:09:34
// Design Name: 
// Module Name: ALUControl
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


//module ALUControl(
//     input [1:0] ALUOp,
//     input [1:0] Funct,
//     input [3:0] Opcode,
//     output reg [3:0] ALUCtrl
//);

//always @(ALUOp)
//begin
//  case(ALUOp)
//     2'b00: ALUCtrl = 4'b0100; // LW ose SW // me mbledhje  
//     2'b01: ALUCtrl = 4'b1100; //BEQ (zbritje)
     
//     2'b10: //R format
//        case(Opcode)
//            4'b0000:
//                case(Funct)
//                    2'b00: ALUCtrl = 4'b0000; // AND
//                    2'b01: ALUCtrl = 4'b0010; // OR
//                    2'b10: ALUCtrl = 4'b0011; // XOR
//                endcase
//            4'b0001:
//                case(Funct)
//                    2'b00: ALUCtrl = 4'b0100; // ADD
//                    2'b01: ALUCtrl = 4'b1100; // SUB
//                endcase
//            4'b0010:
//                case(Funct)
//                    2'b00: ALUCtrl = 4'b0110; // SLL
//                    2'b01: ALUCtrl = 4'b0111; // SRA
//                endcase
//        endcase
//      2'b11: // I format
//        case(Opcode)
//            4'b1001: ALUCtrl = 4'b0100; // ADDI
//            4'b1010: ALUCtrl = 4'b1100; // SUBI
//            4'b1011: ALUCtrl = 4'b0001; // SLTI
//        endcase
//  endcase  
//end
//endmodule
module ALUControl(
    input [1:0] ALUOp,
    input [1:0] Funct,
    input [3:0] Opcode,
    output reg [3:0] ALUCtrl
);

always @(ALUOp or Opcode or Funct)
begin
    case (ALUOp)
        2'b00: ALUCtrl <= 4'b0100; // LW ose SW // me mbledhje  
        2'b01: ALUCtrl <= 4'b1100; // BEQ (zbritje)
        2'b10: // R format
            case (Opcode)
                4'b0000:
                    case (Funct)
                        2'b00: ALUCtrl <= 4'b0000; // AND
                        2'b01: ALUCtrl <= 4'b0010; // OR
                        2'b10: ALUCtrl <= 4'b0011; // XOR
                    endcase
                4'b0001:
                    case (Funct)
                        2'b00: ALUCtrl <= 4'b0100; // ADD
                        2'b01: ALUCtrl <= 4'b1100; // SUB
                    endcase
                4'b0010:
                    case (Funct)
                        2'b00: ALUCtrl <= 4'b0110; // SLL
                        2'b01: ALUCtrl <= 4'b0111; // SRA
                    endcase
            endcase
        2'b11: // I format
            case (Opcode)
                4'b1001: ALUCtrl <= 4'b0100; // ADDI
                4'b1010: ALUCtrl <= 4'b1100; // SUBI
                4'b1011: ALUCtrl <= 4'b0001; // SLTI
            endcase
    endcase  
end

endmodule
