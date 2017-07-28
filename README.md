# FPGA Intro Guide

This is a relatively straightforward guide to designing, building and programming an FPGA using the Quartus Prime Development Suite. This guide also includes an example Quartus Project, called Braindrop, that will be referred to throughout the guide.

## Tools Used

* Quartus Prime Standard Edition
* ModelSim Simulation Tool
* Qsys Systems Integration Tool
* Intel Arria 10 GX Development Kit (Optional)

---

## Preface

Think of a Field-Programmable Gate Array ([FPGAs](https://en.wikipedia.org/wiki/Field-programmable_gate_array)) as a processor whose physical logic you can code and design. Quite literally, what FPGA design tools like Quartus Prime do is to take a Hardware Description Language (HDL), such as Verilog or VHDL, and map it to physical digital logic onto a processor. This means, that given the time and resources, it is viable to program the logic of an x64 computer processor, such as the Intel i7, onto an FPGA. In fact, due to their versatility, FPGAs are largely used as test beds to prototype custom PCBs or chipsets.

## Design Process

The design process for FPGA programming is straightforward:
* *Analysis & Synthesis*
  * This step compiles your HDL code, checking for syntax errors similar to a compiler.
* *Simulation*
  * Tools such as ModelSim can use waveforms as inputs to simulate and verify your logic
  * If you do not have an FPGA, the following steps are unnecessary
* *Fitter* (place & route)
  * This step takes your HDL and physically maps it to the surface of the FPGA, using a series of digital logic gates
* *Assembler*
  * This step generates a programming file; in the case of Quartus, it generates a file with a `.sof` extension (SRAM object file)
  * This programming file is what is interpreted by the hardware and is used primarily for hardware verification
* *Timing/Power Analysis*
  * These steps are optional; however, they give you insight into the efficiency & power consumption of your FPGA under different conditions

## Quartus Prime Layout

![image](https://user-images.githubusercontent.com/15108659/28729366-197cd9e4-7381-11e7-93ab-8a0e6f933b34.png)

The general layout for Quartus Prime is like any IDE. It includes a files tab on the left, displaying HDL files present in the directory. Additionally, it has a console on the bottom which continually displays log information relevant to the task at hand. As mentioned before, Quartus neatly encapsulates the FPGA design process into a list of todo items. During the compilation process, successfully completed tasks such as Analysis or Fitting get check-marked and logged into the console below.

For device specific design, it is essential to specify the product number of the FPGA that you are using. To change or setup your device, navigate to *Assignments &rarr; Device*.

#### Intel FPGA Naming Convention
Recall that the naming convention for Intel Arria 10 FPGAs is as follows:

![image](https://user-images.githubusercontent.com/15108659/28729851-c2b2eb6a-7382-11e7-8a2c-1f008e8a0f15.png)

---

# Sample Project

The included sample project is called braindrop, it includes an HDL file called `braindrop.v`, which is a very simple Verilog program that activates a series of LEDs on the Intel Arria 10 GX based on user input. Even though this program is fairly low level, it does demonstrate the usage of fundamental CS principles in relation to FPGA Development

The important piece of `braindrop.v` involves its input and output parameters:

```
module braindrop (clk, IN0, IN1, LEDG, LEDR);
  input clk, IN0, IN1;     // clock typically from 10MHz to 50MHz
  output reg [7:0] LEDG, LEDR;
```

## Pin Planning
Once the analysis & synthesis command has been executed, the pin planner in Quartus Prime automatically detects the variable names used and their respective functions.

![image](https://user-images.githubusercontent.com/15108659/28730546-7667a874-7385-11e7-8d10-b34a56a16c73.png)

In this screenshot, various pins have already been assigned. However, it is important for you to look through the documentation to determine which pins are available for use. In this case of the Intel Arria 10 GX, its [documentation](https://www.altera.com/documentation/iga1437675412911.html#bhc1412754188509) give the location of User defined I/O pins available for usage. Once these locations have been identifed, use the Pin Planner (*Assignments &rarr; Pin Planner*) to specifically define where on the FPGA certain pins will reside.

### Quartus Pin Planner
![image](https://user-images.githubusercontent.com/15108659/28730824-58808c94-7386-11e7-9a77-9847657804d2.png)
