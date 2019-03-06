# MuxOfMux
Vivado turns all circuits into the primitives of a CLB Slice: LUTs, muxes, carry-logic, xor gates, d flip flops. Understanding these is the goal of this course. We have covered XOR gates and LUTs. The goal now is to cover muxes. 

## m2x1Mux

#### Port Diagram

#### Verilog Code

![1550091245584](1550091245584.png)

#### RTL Schematic Screen shot

![1550091225637](1550091225637.png)

#### Synthesis Schematic Screen shot

![1550091286217](1550091286217.png)

#### Implementation Device screen shot zoomed in on something interesting

![1550091912575](1550091912575.png)

Use of multiple Luxes

#### Testing

switch2 is the select switch,

switch1 is the input when SW2 is low

Switch0 is the input when SW2 is high

three leds should run at the same time

non selected inputs should not affect the output. 

This mux is implemented both with gates, tristate and RTL. 

*How is the RTL example related to a tri-state buffer?*

It functions very similarly, with the select used as the "switch" in the tristate, although it cannot drive one wire with two inputs, so it avoids that with two muxes.

*What are the differences between the three at after RTL Analysis?*

The tristate included a mux to pick a driving high or low value, and the assign logic used logic gates, but the mux logic was shown with a normal 2X1 mux chip, with no extra additions.

*What are the differences between the three when implemented in the FPGA?*



*What are the differences after synthesis in the schematic?*

The two non mux functions work similarly to previous labs, with same logic and different input orders.  The mux function has 3 more LUTS used in the synthesis schematic, with seemingly redundant inputs from the select switch, with every other input working like previous functions.

*What happened in the Device implementation to these three? are they all the same or different?*

*Is the RTL implementation in your opinion too cryptic?* 

*Harmonize the ? : with the description of these assign conditional symbols in this  [ut](https://www.utdallas.edu/~akshay.sridharan/index_files/Page5212.htm) manual.* 

*Can you leverage any of these to make a m4x2 mux? Describe what you tried here before looking at the m4x2 mux project.* 

## m16x4Mux

#### Port Diagram

#### Verilog Code

![1550248277643](1550248277643.png)

#### RTL Schematic Screen shot

![1550247957070](1550247957070.png)

#### Synthesis Schematic Screen shot

![1550248310445](1550248310445.png)

#### Implementation Device screen shot zoomed in on something interesting

![1550248734219](1550248734219.png)

Main combinational logic(Left) being used with secondary combinational logic(right)

#### Testing

Using the buttons as a number selector, with the digits (BTNR,BTND,BTNL,BTNU) in binary, convert the combination of buttons to a number, and then SW[num] will be the active input. To test this, use the buttons to count up in binary, throwing random switches, then throwing the intended trigger switch, and then throwing more random switches. Only the intended active switch should impact the output of LED[0] all random switches should be void.

How is manually testing this circuit different?*

Using the buttons is necessary

*Put a screen shot of the exploded design sources here:*

![1550250525593](1550250525593.png)

*Put a screen shot of the exploded RTL schematic here:*

*How many port diagrams are necessary for this project?*

 3

*How many modules are there?*

3

*How many implemented or instantiated modules are there?*

21

*In the RTL schematic, what is Vivado trying to communicate to us with the colors yellow and blue?*

Yellow represents a natural function, something that is known by Vivado, and blue is an created function, like a class in a programming language, that represents a set of known Vivado functions.

*How many lines of verilog code are there in this design?*

41

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the schematic started?*

RTL

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the schematic finished?*

Synthesis

*What typically changes between the schematic start and finish?*

The schematic logic changes from what is written in the program to what is most efficient according to Vivado 

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the device or FPGA usage diagram started?*

Synthesis

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the device or FPGA usage diagram finished?*

Impliementation

*At what workflow stage (RTL, Synthesis, Implementation, Generate Bitstream) is the XDC file last checked?*

## m16x4MuxRTL

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot![1550253167104](1550253167104.png)

#### Synthesis Schematic Screen shot

![1550255750503](1550255750503.png)

![1550255784371](1550255784371.png)

![1550255807066](1550255807066.png)

![1550255841418](1550255841418.png)

![1550255854771](1550255854771.png)

![1550255728421](1550255728421.png)

#### Implementation Device screen shot zoomed in on something interesting

![1550255949250](1550255949250.png)

Have not yet figured out what these center inter chips do, but they are very active across the FPGA

#### Testing

*Go through each line of the code and comment on it .. explain the variables .. explain what is happening. Paste the commented verilog code here.*  

*This is the first program to use registers. Why are registers needed?* 

*What drives [15:8] LED?*

*MuxInput gets information from where?*

*Why is enter necessary?*

*What is the difference between initial and reset?*

*Why is initial and reset necessary for muxInput, but not LED?*

because muxInput is defined as a register, and stores information, where LED is a normal output, that only reacts to outside conditions such as muxInput and does not store data.

*How many lines of verilog code were necessary to create the 16x4 mux?*

*How many lines of verilog code were necessary to manually test the 16x4 mux with the nexys4ddr board?*

*How many verilog modules were used in this Vivado project?*

*Where is the original documentation for this command that creates muxes?* 
It is impossible to prove a negative, such as "it is impossible" .. "It is not on the internet." The appropriate response is to **document exhaustion**.  This means writing a list of places tried, URL's tried, experiments performed that were close but not answer the question. The goal of  **documented exhaustion** is to provide a starting point for someone else to take a stab at answering the question.  Read the below and either answer the question or add to the **documented exhaustion**. 

Search terms tried: verilog bit width

URL's read that are close but don't answer the question:
This stackexchange article talks about [verilog width concatenation](https://electronics.stackexchange.com/questions/282357/what-is-supposed-to-happen-in-verilog-if-a-signal-of-one-width-is-assigned-to-an) ... which is a similar topic.    
This presentation from [Standford](https://web.stanford.edu/class/archive/ee/ee371/ee371.1066/tools/verilog_tips.pdf) talks about how to build arrays of wires but not this command.    
This is a lab from [University of Maryland College Park](https://ece.umd.edu/class/enee245.S2015/Lab7.pdf) very similar to this lab, but doesn't mention this technique.    
This is the [link](http://electrosofts.com/verilog/mux.html) that inspired playing around with this command.    
[Cliff Cummings](http://www.sunburst-design.com/papers/)  is an engineer that has been at the forefront of driving Verilog and System Verilog evolution and maybe in his writing somewhere there is an answer. 

## 5Lut_Mux

One goal might be to use the primitives within the FPGA CLB. Chapter 3 of the Vivado 7 Series Libraries  lists off the primitives. Chapter 4 describes how to implement them using VHDL and Verilog. Explore the LUT and MUX in this project. 

#### Port Diagram

#### Verilog Code

#### RTL Schematic Screen shot

#### Synthesis Schematic Screen shot

#### Implementation Device screen shot zoomed in on something interesting

#### Testing

Look at the truth table in the Verilog code and be able to describe the switches needed to access a row in it and predict the output. 

#### Prompts

*Does it look like the primitives can be accessed in Verilog?* 

*Can you see a direct relationship between the primitive used and the primitive referenced in the Verilog code?*

*The Mux implementation leaf cell seems to highlight a vertical path within the CLB. Why?*

*How is the LUT instantiation different from the normal instantiation of calling a pre-existing module ?*

*What Line of the Code puts a truth table in the LUT?*

*How many rows are there to the truth table?*

*How is the LUT instantiation different from the normal instantiation of calling a pre-existing module?*

*Look through chapters 3 and 4 of the Vivado 7 Series Libraries.  Focus on the Design Entry Method box.  Then answer these questions.*

*What does instantiation mean?*

*What does inference mean?*

*Have we inferred buffers (BUFG) in projects before?*

*What does instantiation mean?*

*What does inference mean?*

*Verilog has tristate [buffer primitives](http://verilog.renerta.com/mobile/source/vrg00003.htm)  named bufif0 and bufif1. These names don't appear in the Vivado 7 series libraries. Why? What are the risks of using the buffers Xilinx has named in this document?*

*Look up LUT6 in the Vivado 7 series library document. We instantiated it in this project. Is Instantiation possible according to the document?* 

*What is the preferred design entry method?* 

*Is MUXCY in the Vivado 7 series library document like LUT6?* 

*We instantiated MUXCY in this project's verilog code. And it looks like it was successfully implemented. We can test it. Read this [article](https://forums.xilinx.com/t5/Welcome-Join/where-are-the-muxcy-and-xorcy/td-p/311931) from from Jan 2013 about MUXCY and XORCY. Do you think it is wise to use this piece of a CLB in a circuit design project?*

*What would you guess is the preferred entry method for a MUXCY .. if it existed in the Vivado 7 series library?*

*Why do you think Xlinix still supports MUXCY (because we used it!), yet don't document it?*

*Xilinix was the [first FPGA vendor](http://hardwarebee.com/list-fpga-companies/) to start shipping LUT6 FPGAs. Intel FPGAs come from purchasing Xilinx's major competitor for years .. and ships a LUT6. How does [Flex-Logix](http://www.flex-logix.com/6lut-faster-denser/) fit into this competition?*

*Why is this question important to you, the college, the market place?* 

*What does [Flex-Logix name it's equivalent](http://www.flex-logix.com/dsp-applications/) of LUT6?*  

*Is the code on this [web site](http://www.flex-logix.com/dsp-applications/) verilog or it's competitor VHDL?*

*What class at HCC teaches you what a [FIR](http://www.flex-logix.com/dsp-applications/) is?* 

## Ethics

The ethics questions below are more important than your answers. The goal in answering them is to remember the question. So the best answers are a non-trivial, thoughtful, relevant hypothesis. 

#### Ethics of Change

The simplicity of the RTL versions of the mux command raises the question of what is possible with the assign command? Where is the manual that goes over all this? Where can we discover what is possible? The problem is that there are many manuals with complete backwards compatibility to the dawn of verilog history in the 1980's.  These are the official Verilog standards.  They are all supersets .. meaning some vendors (Vivado) **don't** implement everything. 

​	IEEE 1364-1995 (Verilog 1995)  
​	IEEE  1364-2001 (Verilog 2001)   
​	IEEE  1364-2005 (Verilog 2005)  
​	IEEE  1800-2005 (SystemVerilog)  
​	IEEE  1800-2009 (SystemVerilog)  
​	IEEE  1800-2012 (SystemVerilog)   
​	IEEE  1364-2014 ([Verilog-AMS 2.4](http://www.accellera.org/downloads/standards/v-ams))    

It is impossible to test thousands inputs combinations and state transitions by hand. This problem coupled with the chaos of Verilog subsets of a superset make searching the internet for verilog solutions problematic. The reasons for this chaos involve testing.  This is discussed below. But first we must look at the ethics of change. 

Engineers are professionals like doctors and lawyers. They are by law allowed, protected and encouraged to experiment/improve at every opportunity. Engineers make new versions. Doctors improve treatment and surgery techniques.  Lawyers find new ways to interpret laws and dream up new ones. This constant change creates a chaos. 

Technicians, nurses and paralegals & judges are the anchors, the experts, the people that build walls around this change. They extract from the chaos what works, complain about what doesn't and become the conservative force that captures what is good for society. **In the process technicians, nurses and paralegals become experts.**  Engineers, doctors and lawyers are merely artists. There is lots of research showing that once the human species captures some knowledge, it never forgets .. even if the number of individuals knowing a very small piece of it becomes much smaller than during the technology's growth period. 

This part of society works. But there is a down side. A barrier, a Catch22 starts growing for those trying to become Engineers or Technicians, Doctors or Nurses. Specialization, complexity, pre-requisite knowledge starts growing. A new generation has trouble getting a job. They ask "How can I get the experience the job says I need without getting the job?" An old generation creates a bubble around themselves. The younger generation sees this as a barrier to entry. The older generation retires. Society in general get's scared.  Standing still, repeating success is a disaster for any organization. 

*So how does a younger generation pop a generation bubble or climb over the experience barrier and get a job?*

*What does the younger generation have to do on their resume and while in college ... when the complexity, the accumulated knowledge, the expertise, the experience required seems impossible to accumulate?*

*How does a young generation serve the world, the human species popping this generational bubble?*



