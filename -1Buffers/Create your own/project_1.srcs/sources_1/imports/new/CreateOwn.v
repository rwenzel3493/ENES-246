`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 03:36:47 PM
// Design Name: 
// Module Name: CreateOwn
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


module project_1(
    input A,
    input B,
    input C,
    output X,
    output Y
    );
    wire AB, ABC, AC;
    assign AB = A&B;
    assign ABC = !(AB|C);
    assign AC = !(A&C);
    assign X = AB|C;
    assign Y = ABC^AC;
    
endmodule
