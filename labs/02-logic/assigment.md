# Lab 2: Combination logic
##Jakub Zdrazil
### Truth table
| **dec. Equivalent** | **B[1:0]** |**A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 00 | 00 | 0 | 1 | 0 |
| 1 | 00 | 01 | 0 | 0 | 1 |
| 2 | 00 | 10 | 0 | 0 | 1 |
| 3 | 00 | 11 | 0 | 0 | 1 |
| 4 | 01 | 00 | 1 | 0 | 0 |
| 5 | 01 | 01 | 0 | 1 | 0 |
| 6 | 01 | 10 | 0 | 0 | 1 |
| 7 | 01 | 11 | 0 | 0 | 1 |
| 8 | 01 | 00 | 1 | 0 | 0 |
| 9 | 10 | 01 | 1 | 0 | 0 |
| 10 | 10 | 10 | 0 | 1 | 0 |
| 11 | 10 | 11 | 0 | 0 | 1 |
| 12 | 11 | 00 | 1 | 0 | 0 |
| 13 | 11 | 01 | 1 | 0 | 0 |
| 14 | 11 | 10 | 1 | 0 | 0 |
| 15 | 11 | 11 | 0 | 1 | 0 |


### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/02-logic/greater_than.JPG)

   Less than:

   ![](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/02-logic/less_than.JPG)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](images/comparator_min.png)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

       
        -- case: 1
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination 0000, 0000 FAILED" severity error;
        
        
       -- case: 2
       	s_b <= "0000"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Input combination 0000 0001 FAILED"
        severity error;
        
        
        --case: 3
        s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Input combination 0000 0011 FAILED"
        severity error;
        
        --case: 16
        s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Input combination 0001 0000 FAILED"
        severity error;
        
        --case: 17
        s_b <= "0001"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Input combination 0001 0001 FAILED"
        severity error;
     

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![](https://github.com/xzdraz12/digital-electronics-1/blob/main/labs/02-logic/terminal.JPG)

3. Link to your public EDA Playground example:

   [Link to my EDA Playground](https://www.edaplayground.com/x/aFAx)