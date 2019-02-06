`timescale 1ns / 1ps

module vcb(
   input  sw0,
   input  sw1,
   output tri LED
   );
   
   //and
   bufif1 b1(LED, sw0, sw1);
   //nor
   bufif1 b2(LED2,!sw0,!sw1);
   //nand
     bufif1 b3(LED3,!sw0,!sw0);
     bufif1 b4(LED4,!sw1,!sw1);
     //xor
   bufif1 b5(LED5, !sw1, sw0);
   bufif1 b6(LED6, !sw0, sw1);
     //nxor
     bufif1 b7(LED7, !sw1, !sw0);
     bufif1 b8(LED8, sw0, sw1);
     
     
endmodule