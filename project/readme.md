# Running text on 7-seg displays

### Team members

* Josef Kaplan (responsible for code, documentation)
* Hajnalka Csiba (responsible for code, code mainteance)
* Jakub Zdrazil (responsible for code, github repository)


### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [BitStream](#bitstream)
* [References](#references)

<a name="objectives"></a>

## 
Goal of this project is to make a running text using eight seven-segment displays using VHDL code and Nexys A50-T board. 
Text has two mods - running rightwars and running leftwards. Direction is opted by using two pushbuttons, third pushbutton is for resetting the process.

<a name="hardware"></a>

## Hardware description

For this project we are using Nexys A50-T development board.
In this project we are using these following features: eight 7-segment displays and three momentary pushbuttons.
This board has also many other features: USB port, PIC24 port, Ethernet port, FPGA LED and reset button, VGA connector, Audio connector, Programming mode jumper, XADC, CPU reset button, Pmod ports, Temperature sensor, JTAG port, three RGB LEDs, sixteen Slide switches and LEDs, Microphone, SD/USB jumper, SD slot, power selector, DDR2 memory

![Nexys A50-T development board](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/NexysA7.png "Nexys A50-T development board" )
 
<a name="modules"></a>

## VHDL modules description and simulations

#### clock_enable

* In this module clock signal is declared 
* This module also determinates how many of clock pulses are needed to generate one enable signal
* Full code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/clock_enable.vhd)


#### cnt_up_down

* In this module principles of the "reset" are declared
* Full code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/cnt_up_down.vhd)

#### char_7seg

* We used this module to specify alphabet and numbers from 0 to 9
* Each character is represented by 5-bit number
* Some characters are represented by the same combination because of their similarity on 7-segment display
* Full code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/char_7seg.vhd)


#### driver_7seg_8digits

* This module is used for setting up the refresing rate of displays
* It defines 3-bit combinations of the clock signal and connects it with each anode
* Full code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/driver_7seg_8digits.vhd)
* TestBench code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sim_1/new/tb_driver_7seg_8digits.vhd)
* By pointing the mouse on following pictures more informations will be provided

 ![simulation backward](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/tb_driver_backward.PNG "Simulation of the backward mode")
 ![simulation forward](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/tb_driver_forward.PNG "Simulation of the forward mode")


#### states_1

* This module defines the order of each state in the process
* Each state is defined in form of characters displayed on displays
* There are two scenarios - forward and backward
* When "forward" is enabled, the state number is increasing by every event
* When "backward" is enabled, the state number is decreasing by every event
* TestBench code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sim_1/new/tb_states_1.vhd)
* ["backward" states diagram](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/backward_diagram.JPG) ["forward" states diagram](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/forward_diagram.JPG) 
* By pointing the mouse on following pictures more informations will be provided

 ![simulation states forward](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/tb_forward_states.PNG "Simulation of the states when forward is enabled")
 ![simulation states backward](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/tb_backward_states.PNG "Simulation of the states when backward is enabled")

<a name="top"></a>

## TOP module description

Top module is used for connecting the signals with each output such as buttons or display segments
* Button C is responsible for "reset"
* Button L is responsible for "forward"
* Button R is responsible for "backward"
* next seven signals are connected to display segments (a, b, c, d, e, f, g)
* all segments on one display are connected to one common anode 

Full code is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/top.vhd)

<a name="video"></a>

## Video

You can also find more about this project by clicking [here](https://www.youtube.com/watch?v=lQNkORvfDw4)


<a name="bitstream"></a>
## BitStream

Generated Bitstream required in order to run our project on Nexys A50-T board is aviable [here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.runs/impl_1/top.bit)

<a name="references"></a>
## References

1. https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1
2. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/06-counter
3. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/07-display_driver
4. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/08-traffic_lights
5. https://www.xilinx.com/content/dam/xilinx/imgs/prime/NexysA7-top-600__89503.1541089438.1280.1280.jpg