
module m16x4Mux(
    input [15:8] I,
    input [3:0] select,
    input bank,
    input enter,
    input reset,
    output bankSelected,
    output q,
    output reg [15:8] LED,
    output [3:0] LEDselected
    );
    
    reg [15:0] muxInput; //created the muxinput as a register

    initial muxInput=0; //sets an initial value for all values of the array
    
    always @* begin 
        if (reset) muxInput = 0; //If reset is true, only reset, and reset all held values
        else begin 
            if (enter)  
                if (bank) muxInput[15:8] = I[15:8]; //if enter and bank are true, map mux input(internal variable) to switches
                else muxInput[7:0] = I[15:8]; //if enter is true and bank is false, set the first 8 internal variables to input
            else if (bank) LED[15:8] = muxInput[15:8];
            else LED[15:8] = muxInput[7:0];
        end
    end
    assign LEDselected = select;
    assign q = muxInput[select];
    assign bankSelected = bank;
endmodule
