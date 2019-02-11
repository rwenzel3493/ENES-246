`timescale 1ns / 1ps

module vcb(
   input  A, B, C,
   
   output X, Y
   );
   wire w1,w2,w3,w4;
   or a1(w1,A,B);
   nand  o1(w2,w1,A);
   and a2(w3,~C,w2);
   nor   o2(X,C,w2);
   assign Y = A&(~C);
endmodule