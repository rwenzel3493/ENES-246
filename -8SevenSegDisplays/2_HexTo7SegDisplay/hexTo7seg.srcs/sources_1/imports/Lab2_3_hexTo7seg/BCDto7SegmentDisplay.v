`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: bcdto7segment_dataflow
/////////////////////////////////////////////////////////////////

module HEXto7segment(
    input [3:0] hex,
    output [6:0] seg
    );
	assign seg[6] = ( ~hex[2]& hex[1] )|( hex[1] &~hex[0] )|( ~hex[3]& hex[2]& ~hex[1] )|( hex[3]& ~hex[2] )| ( hex[3] &hex[0]); // seg g or 6
	assign seg[5] =  (~hex[1]& ~hex[0] )|( ~hex[3]& hex[2] &~hex[1] )|( hex[2]& ~hex[0] )|( hex[3] &~hex[2] )|( hex[3]& hex[1]);  // seg f or 5
	assign seg[4] = (~hex[2]& ~hex[0] )|( hex[1]& ~hex[0] )|( hex[3] &hex[1] )|( hex[3]& hex[2]);  // seg e or 4
	assign seg[3] = (~hex[3]& ~hex[2] & ~hex[0] ) | ( ~hex[2]& hex[1]& hex[0] ) | ( hex[2] & ~hex[1]& hex[0] ) | ( hex[2]& hex[1]& ~hex[0] ) | ( hex[3] & ~hex[1] & ~hex[0]);  // seg d or 3
	assign seg[2] = (~hex[3]& ~hex[1] )|( ~hex[3] &hex[0] )|( ~hex[1]& hex[0] )|( ~hex[3] &hex[2] )|( hex[3]& ~hex[2]);  // seg c or 2
	assign seg[1] = (~hex[3] &~hex[2] )|( ~hex[3] &~hex[1] &~hex[0] )|( ~hex[2] &~hex[0] )|( ~hex[3]& hex[1]& hex[0]) | (hex[3] &~hex[1] &hex[0]);  // seg b or 1
	assign seg[0] = ((~hex[2] &~hex[0]) | (~hex[3]& hex[1]) | (~hex[3]& hex[2]& hex[0]) | (hex[2]& hex[1]) | (hex[3] &~hex[2] &~hex[1]) | (hex[3] &~hex[0]));  // seg a or 0

endmodule
