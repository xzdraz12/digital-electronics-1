------------------------------------------------------------
--
-- Driver for 8-digit 7-segment display.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- Entity declaration for display architecture

-- Inputs:
--   clk
--   reset
--   forward
--   backward 

-- Outputs:
--   seg_o(6:0)   -- Cathode values for individual segments
--   dig_o(3:0)   -- Common anode signals to individual digits
--
------------------------------------------------------------
entity driver_7seg_8digits is
    port(
        clk      : in  std_logic;
        reset    : in  std_logic;
        forward  : in  std_logic;
        backward : in  std_logic;
        seg_o    : out std_logic_vector(6 downto 0);
        dig_o    : out std_logic_vector(7 downto 0)
    );
end entity driver_7seg_8digits;

------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------
architecture Behavioral of driver_7seg_8digits is
  
    -- Internal clock enable
    signal s_en    : std_logic;
    -- Internal 3-bit counter
    signal s_cnt   : std_logic_vector (2 downto 0);
    -- Internal 5-bit value for 7-segment decoder
    signal s_char  : std_logic_vector (4 downto 0);
     
    signal s_data0 : std_logic_vector (4 downto 0);
    signal s_data1 : std_logic_vector (4 downto 0);
    signal s_data2 : std_logic_vector (4 downto 0);
    signal s_data3 : std_logic_vector (4 downto 0);
    signal s_data4 : std_logic_vector (4 downto 0);
    signal s_data5 : std_logic_vector (4 downto 0);
    signal s_data6 : std_logic_vector (4 downto 0);
    signal s_data7 : std_logic_vector (4 downto 0);
    

begin
    --------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates 
    -- an enable pulse every 2 ms
    clk_en0 : entity work.clock_enable
        generic map(
            -- FOR SIMULATION, CHANGE THIS VALUE TO 2
            -- FOR IMPLEMENTATION, KEEP THIS VALUE TO 200,000
            g_MAX => 200000
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 2-bit
    -- down counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            g_CNT_WIDTH => 3
        )
        port map(             
            en_i        => s_en,
            cnt_up_i    => '0',
            clk         => clk,
            reset       => reset,
            cnt_o       => s_cnt                   
        );

    --------------------------------------------------------
    -- Instance (copy) of char_7seg entity performs a 7-segment
    -- display decoder
    char2seg : entity work.char_7seg
        port map(
            char_i => s_char,
            seg_o => seg_o
        );
    --------------------------------------------------------
    -- Instance (copy) of states_1 
    states : entity work.states_1
        port map(
            clk      => clk,
            reset    => reset,
            forward  => forward,
            backward => backward,           
            data0_o  => s_data0,
            data1_o  => s_data1,
            data2_o  => s_data2,
            data3_o  => s_data3,
            data4_o  => s_data4,
            data5_o  => s_data5,
            data6_o  => s_data6,
            data7_o  => s_data7           
        );
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if  rising_edge(clk) then
            if (reset = '1') then
                dig_o <= "11111111";
            elsif (forward = '1') then 
                case s_cnt is
                    when "111" =>
                        s_char <= s_data7;
                        dig_o  <= "01111111";

                    when "110" =>
                        s_char <= s_data6;
                        dig_o  <= "10111111";

                    when "101" =>
                        s_char <= s_data5;
                        dig_o  <= "11011111";
                        
                    when "100" =>
                        s_char <= s_data4;
                        dig_o  <= "11101111";

                    when "011" =>
                        s_char <= s_data3;
                        dig_o  <= "11110111";

                    when "010" =>
                        s_char <= s_data2;
                        dig_o  <= "11111011";
                    
                    when "001" =>
                        s_char <= s_data1;
                        dig_o  <= "11111101";

                    when others =>
                        s_char <= s_data0;
                        dig_o  <= "11111110";
                end case;
         
            elsif (backward = '1') then 
                case s_cnt is
                    when "111" =>
                        s_char <= s_data7;
                        dig_o  <= "01111111";

                    when "110" =>
                        s_char <= s_data6;
                        dig_o  <= "10111111";

                    when "101" =>
                        s_char <= s_data5;
                        dig_o  <= "11011111";
                        
                    when "100" =>
                        s_char <= s_data4;
                        dig_o  <= "11101111";

                    when "011" =>
                        s_char <= s_data3;
                        dig_o  <= "11110111";

                    when "010" =>
                        s_char <= s_data2;
                        dig_o  <= "11111011";
                    
                    when "001" =>
                        s_char <= s_data1;
                        dig_o  <= "11111101";

                    when others =>
                        s_char <= s_data0;
                        dig_o  <= "11111110";
                end case;
           end if;
       end if; 
       
    end process p_mux;
 
end architecture Behavioral;
