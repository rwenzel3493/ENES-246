`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 01:24:44 PM
// Design Name: 
// Module Name: NandXor
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


module NandXor(
    input A,
    input B,
    input C,
    output X,
    output Y
    );
    assign X = A^B^C;
    assign Y = !(A&B&C);

endmodule
