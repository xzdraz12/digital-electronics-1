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

Nexys A50-T development board](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/pictures/NexysA7.PNG)
 
<a name="modules"></a>

## VHDL modules description and simulations

#### Clock Enable

* In this module clock signal is declared 
* This module also determinates how many of clock pulses are needed to generate one enable signal
* Full code can be found ![here](https://github.com/xzdraz12/digital-electronics-1/blob/main/project/project/project_final.srcs/sources_1/new/clock_enable.vhd)
 
<a name="top"></a>

## TOP module description and simulations

Write your text here.

<a name="video"></a>

## Video

You can also find more about this project by clicking at this YouTube link:

![YouTube video](https://www.youtube.com/watch?v=lQNkORvfDw4)

<a name="references"></a>

## References

1. https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1
2. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/06-counter
3. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/07-display_driver
4. https://github.com/tomas-fryza/digital-electronics-1/tree/master/labs/08-traffic_lights
5. https://www.xilinx.com/content/dam/xilinx/imgs/prime/NexysA7-top-600__89503.1541089438.1280.1280.jpg