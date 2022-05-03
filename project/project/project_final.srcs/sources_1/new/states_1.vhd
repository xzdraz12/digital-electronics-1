------------------------------------------------------------
--
-- Traffic light controller using FSM.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
-- This code is inspired by:
-- [1] LBEbooks, Lesson 92 - Example 62: Traffic Light Controller
--     https://www.youtube.com/watch?v=6_Rotnw1hFM
-- [2] David Williams, Implementing a Finite State Machine in VHDL
--     https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/
-- [3] VHDLwhiz, One-process vs two-process vs three-process state machine
--     https://vhdlwhiz.com/n-process-state-machine/
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for traffic light controller
------------------------------------------------------------
entity states_1 is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;  
        forward : in  std_logic;  
        backward: in  std_logic;                
          
        data0_o : out  std_logic_vector(4 downto 0);
        data1_o : out  std_logic_vector(4 downto 0);
        data2_o : out  std_logic_vector(4 downto 0);
        data3_o : out  std_logic_vector(4 downto 0);
        data4_o : out  std_logic_vector(4 downto 0);
        data5_o : out  std_logic_vector(4 downto 0);
        data6_o : out  std_logic_vector(4 downto 0);
        data7_o : out  std_logic_vector(4 downto 0)              
         );
         
end entity states_1;

------------------------------------------------------------
-- Architecture declaration for states_1
------------------------------------------------------------
architecture Behavioral of states_1 is

    -- Define the states
    type t_state is (state1,
                     state2,
                     state3,
                     state4,
                     state5,
                     state6,
                     state7,
                     state8);
                        
    -- Define the signal that uses different states
    signal s_state   : t_state;
    -- Internal clock enable
    signal s_en      : std_logic;
    -- Local delay counter
    signal s_cnt_loc : unsigned(4 downto 0);
    -- Specific values for local counter
    constant c_DELAY_1SEC : unsigned(4 downto 0) := b"0_0100";
    constant c_ZERO       : unsigned(4 downto 0) := b"0_0000";
    
begin
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 250 ms (4 Hz). Remember that 
    -- the frequency of the clock signal is 100 MHz.
    
    -- USE THIS PART FOR FASTER/SHORTER SIMULATION
     --s_en <= '1';
    -- USE THE FOLLOWING PART FOR THE IMPLEMENTATION
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 25000000 -- 250 ms / (1/100 MHz) = 25000000
                                                        
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );        
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- The sequential process with synchronous reset and 
    -- clock_enable entirely controls the s_state signal by 
    -- CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then     -- Synchronous reset
                s_state   <= state1;  -- Set initial state
                s_cnt_loc <= c_ZERO;  -- Clear delay counter
              
            elsif (forward ='1') then
              if(s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
               case s_state is
                    -- If the current state is state1, then wait 1 sec
                    -- and move to the next state2 state.
                    when state1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            -- Move to the next state
                            s_state   <= state2;
                            -- Reset local counter value
                            s_cnt_loc <= c_ZERO;
                        end if;

                    when state2 => 
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state3;
                            s_cnt_loc <= c_ZERO;
                        end if;
                        
                    when state3 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state4;
                            s_cnt_loc <= c_ZERO;
                        end if;

                    when state4 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state5;
                            s_cnt_loc <= c_ZERO;
                        end if;
                               
                    when state5 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state6;
                            s_cnt_loc <= c_ZERO;
                        end if; 
                        
                    when state6 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state7;
                            s_cnt_loc <= c_ZERO;
                        end if;  
                        
                   when state7 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state8;
                            s_cnt_loc <= c_ZERO;
                        end if;

                   when state8 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state1;
                            s_cnt_loc <= c_ZERO;
                        end if;                                         

                   when others =>
                        s_state <= state1;
                        s_cnt_loc   <= c_ZERO;
                end case;
              end if;
                
            elsif (backward ='1') then
              if(s_en = '1') then

                case s_state is

                    when state8 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state7;
                            s_cnt_loc <= c_ZERO;
                        end if;

                    when state7 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state6;
                            s_cnt_loc <= c_ZERO;
                        end if;
                        
                    when state6 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state5;
                            s_cnt_loc <= c_ZERO;
                        end if;

                    when state5 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state4;
                            s_cnt_loc <= c_ZERO;
                        end if;
                               
                    when state4 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state3;
                            s_cnt_loc <= c_ZERO;
                        end if; 
                        
                    when state3 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state2;
                            s_cnt_loc <= c_ZERO;
                        end if;  
                        
                   when state2 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state1;
                            s_cnt_loc <= c_ZERO;
                        end if;

                   when state1 =>
                        if (s_cnt_loc < c_DELAY_1SEC) then
                            s_cnt_loc <= s_cnt_loc + 1;
                        else
                            s_state   <= state8;
                            s_cnt_loc <= c_ZERO;
                        end if;                                         

                   when others =>
                        s_state <= state1;
                        s_cnt_loc   <= c_ZERO;
                end case;
            end if;-- Synchronous reset
          end if; 
        end if; -- Rising edge

    end process p_traffic_fsm;

    --------------------------------------------------------
    -- p_output_fsm:
    -- The combinatorial process is sensitive to state
    -- changes and sets the output signals accordingly.
    -- This is an example of a Moore state machine and
    -- therefore the output is set based on the active state.
    --------------------------------------------------------
    p_output_fsm : process(s_state)
    begin
        case s_state is
            when state1 =>                
                data0_o <= "00000"; --O
                data1_o <= "10100"; --L
                data2_o <= "01110"; --E
                data3_o <= "11001"; --r
                data4_o <= "00000"; --O
                data5_o <= "10111"; --P
                data6_o <= "01110"; --E
                data7_o <= "10100"; --L
            
            when state2 =>
                data1_o <= "00000"; --O
                data2_o <= "10100"; --L
                data3_o <= "01110"; --E
                data4_o <= "11001"; --r
                data5_o <= "00000"; --O
                data6_o <= "10111"; --P
                data7_o <= "01110"; --E
                data0_o <= "10100"; --L 
            
            when state3 =>
                data2_o <= "00000"; --O
                data3_o <= "10100"; --L
                data4_o <= "01110"; --E
                data5_o <= "11001"; --r
                data6_o <= "00000"; --O
                data7_o <= "10111"; --P
                data0_o <= "01110"; --E
                data1_o <= "10100"; --L  
            
            when state4 =>
                data3_o <= "00000"; --O
                data4_o <= "10100"; --L
                data5_o <= "01110"; --E
                data6_o <= "11001"; --r
                data7_o <= "00000"; --O
                data0_o <= "10111"; --P
                data1_o <= "01110"; --E
                data2_o <= "10100"; --L  
            
            when state5 =>
                data4_o <= "00000"; --O
                data5_o <= "10100"; --L
                data6_o <= "01110"; --E
                data7_o <= "11001"; --r
                data0_o <= "00000"; --O
                data1_o <= "10111"; --P
                data2_o <= "01110"; --E
                data3_o <= "10100"; --L  
            
            when state6 =>
                data5_o <= "00000"; --O
                data6_o <= "10100"; --L
                data7_o <= "01110"; --E
                data0_o <= "11001"; --r
                data1_o <= "00000"; --O
                data2_o <= "10111"; --P
                data3_o <= "01110"; --E
                data4_o <= "10100"; --L
            
            when state7 =>
                data6_o <= "00000"; --O
                data7_o <= "10100"; --L
                data0_o <= "01110"; --E
                data1_o <= "11001"; --r
                data2_o <= "00000"; --O
                data3_o <= "10111"; --P
                data4_o <= "01110"; --E
                data5_o <= "10100"; --L
            
            when state8 =>
                data7_o <= "00000"; --O
                data0_o <= "10100"; --L
                data1_o <= "01110"; --E
                data2_o <= "11001"; --r
                data3_o <= "00000"; --O
                data4_o <= "10111"; --P
                data5_o <= "01110"; --E
                data6_o <= "10100"; --L   
            
            when others =>
                data0_o <= "00000"; --O
                data1_o <= "10100"; --L
                data2_o <= "01110"; --E
                data3_o <= "11001"; --r
                data4_o <= "00000"; --O
                data5_o <= "10111"; --P
                data6_o <= "01110"; --E
                data7_o <= "10100"; --L
       
        end case;
      
    end process p_output_fsm;

end architecture Behavioral;