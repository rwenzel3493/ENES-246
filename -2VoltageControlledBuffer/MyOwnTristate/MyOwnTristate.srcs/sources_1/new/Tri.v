`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 10:17:49 AM
// Design Name: 
// Module Name: Tri
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
//this file will replicate certain logic gates.
//shows logic gates truth tables using switches, switch 0 inverted controlls LED 0, and every other switch is a part of a logic gate
//every third switch turns on that "logic gate" using the previous two switches, all of the "gates" output to the same LED.

module Tri(
    input [15:0] SW,
    output LED,
    output LED2

    );
    wire s1s2, s4s5, s7s8, s10s11, s13s14, s0;
    assign s1s2 =  SW[1]&SW[2];
    assign s4s5 = SW[4]|SW[5];
    assign s7s8 = SW[7]^SW[8];
    assign s10s11 = !(SW[10]&SW[11]);
    assign s13s14 = !(SW[14]|SW[13]);
    assign LED = !SW[0];
    bufif1 b1(LED2,s1s2,SW[3]);  //first 3 are and
    bufif1 b2(LED2,s4s5,SW[6]); //second 3 are or
    bufif1 b3(LED2, s7s8, SW[9]); // third 3 are xor
    bufif1 b4(LED2, s10s11,SW[12]); //fourth trio are nand
    bufif1 b5(LED2, s13s14, SW[15]); //fifth trio are nor
    
    
    
endmodule
