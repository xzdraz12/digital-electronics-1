<a name="preparation"></a>

## Preparation tasks (done before the lab at home)

The Nexys A7 board provides five push buttons for user applications.

1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of these push buttons, ie to which FPGA pins are connected and how. What logic/voltage value do the buttons generate when not pressed and what value when the buttons are pressed? Draw the schematic with push buttons.
![Schematic](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/04-segment/n4r.png)

Buttons generate low output when not pressed and high output when pressed.
2. Calculate how many periods of clock signal with frequency of 100&nbsp;MHz contain time intervals 2&nbsp;ms, 4&nbsp;ms, 10&nbsp;ms, 250&nbsp;ms, 500&nbsp;ms, and 1&nbsp;s. Write values in decimal, binary, and hexadecimal forms.

   &nbsp;
   ![Clock Period](https://github.com/tomas-fryza/digital-electronics-1/blob/master/labs/06-counter/images/freq.png)

   &nbsp;

   ![number of periods](https://github.com/tomas-fryza/digital-electronics-1/blob/master/labs/06-counter/images/periods.png)
   &nbsp;
   <!--
   https://editor.codecogs.com/
   T_{clk}=\frac{1}{f_{clk}}=
   \textup{number of clk period} = \frac{\textup{time interval}}{T_{clk}}=
   -->

   | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
   | :-: | :-: | :-: | :-: |
   | 2&nbsp;ms | 200 000 | `x"3_0d40"` | `b"0011_0000_1101_0100_0000"` |
   | 4&nbsp;ms | 100 000 | `x"186A0"` | `b"0001_1000_0110_1010_0000"`|
   | 10&nbsp;ms | 1 000 000 | `x"F4240"`| `b"1111_0100_0010_0100_0000"`|
   | 250&nbsp;ms | 25 000 000 | `x"17D7840"`| `b"0001_0111_1101_0111_1000_0100_0000"`|
   | 500&nbsp;ms | 50 000 000 | `x"2FAF080"`| `b"0010_1111_1010_1111_0000_1000_0000"`|
   | 1&nbsp;sec | 100 000 000 | `x"5F5_E100"` | `b"0101_1111_0101_1110_0001_0000_0000"` |

