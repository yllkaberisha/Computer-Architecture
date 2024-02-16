`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2024 22:30:18
// Design Name: 
// Module Name: DataPath
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


module DataPath(
input Clock,
input[15:0] PC,
input RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch,
input[1:0]ALUOp,
input[15:0] Instruction,
output[15:0] pc_next );

wire [3:0] Opcode;
wire [1:0] RS;
wire [1:0] RT;
wire [1:0] RD;
wire [3:0] shamt;
wire [1:0] Funct;
wire [7:0] Immediate;
wire[15:0] Immediate16;
wire [1:0] percaktoDestinacionin; // T6 Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I-formati) - MUX M1
wire[15:0] percaktoHyrjenB; // T10 -> E ALU-se ( A eshte readData 1)
wire[15:0] ALUOut; //T11
wire[15:0] DMOut;  // T13 
wire[15:0] WriteDataToRegister; //T9
wire Zero, Overflow, CarryOut; // T20 - T21
wire [3:0] ALUControlOut; // T19

wire [15:0] ReadRS; //T7
wire [15:0] ReadRT; //T8


// e ndajm instruksionin
assign Opcode = Instruction[15:12];
assign RS = Instruction[11:10];
assign RT = Instruction[9:8];
assign RD = Instruction[7:6];
assign shamt = Instruction[5:2];
assign Funct = Instruction[1:0];
assign Imediate = Instruction[7:0];

// register file
mux2ne1_2bit muxDestinacionit(RT,RD, RegDst,percaktoDestinacionin);  // M1
mux2ne1_2bit muxDalja ( ALUOut, DMOut,MemToReg,WriteDataToRegister); // M3

//inicializimi i RF(RS, RT, T6 (RD[RD=RD || RD=RT]), T9, T7, T8, CU_OUT_x, CPU_IN_1, )
RegisterFile RF(RS, RT, percaktoDestinacionin , WriteDataToRegister, ReadRS, ReadRT, RegWrite, Clock);

// alu 

// se pari e zgjerojm ne 16 bita sepse ka me hi ne alu 
assign Immediate16 = {{8{Immediate[7]}}, Immediate[7:0]}; //S1 - T12

mux2ne1_16bit muxALU (ReadRT, Immediate16 , ALUSrc, percaktoHyrjenB); // M2

ALUControl AC(ALUOp, Funct, Opcode, ALUControlOut);

//inicializimi i ALU (T7, T10, T19[3] (BNegate), T19[2:0] (tre bita per me tregu operacionin),  T20,  T21, T22, T11)
ALU_with_extra_operation ALUComplete( ReadRS, percaktoHyrjenB, ALUControlOut, shamt, Zero, Overflow, CarryOut, ALUOut);

// data memory

//inicializimi i Data Memory (T11, T8, CU_OUT_x, CU_OUT_x, CPU_IN_1, T13) 
DataMemory dataMemory( ALUOut, ReadRT, MemWrite, MemRead, Clock, DMOut);

// ------------------------------------------------------------------

// beq 

wire [15:0] rritAdresenPer2 , pc2, ImmediateShifted, ImmediateShiftedPlusPC;
wire PcCarryout;

assign rritAdresenPer2 = 16'd2; // e rritim per dy qe me mar adresen e instruksionit te ardhshem

//assign pc2 = PC + 2;   -- T2
mbledhesi16b rritAdresenPerInstruktsioninAndhshem ( PC , rritAdresenPer2 , pc2 , PcCarryout);  

assign ImmediateShifted = {{Immediate16[14:0], 1'b0}};   //T14


// assign ImmediateShiftedPlusPC = ImmediateShifted + pc2;    -T17
mbledhesi16b rritAdresenPerInstruktsioninMeBEQ ( ImmediateShifted , pc2 , ImmediateShiftedPlusPC , PcCarryout); 
 
//  assign pc_next = (Branch & Zero) ? ImmediateShiftedPlusPC : pc2;   - M4
mux2ne1_16bit beqOrPc2(pc2, ImmediateShiftedPlusPC, Branch & Zero, pc_next);

endmodule
