------------------------------------------------------------
--
-- Traffic lights controller testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_states_1 is
    -- Entity of testbench is always empty
end entity tb_states_1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_states_1 is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_backward : std_logic;
    signal s_forward : std_logic;
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_data0 : std_logic_vector (4 downto 0);
    signal s_data1 : std_logic_vector (4 downto 0);
    signal s_data2 : std_logic_vector (4 downto 0);
    signal s_data3 : std_logic_vector (4 downto 0);
    signal s_data4 : std_logic_vector (4 downto 0);
    signal s_data5 : std_logic_vector (4 downto 0);
    signal s_data6 : std_logic_vector (4 downto 0);
    signal s_data7 : std_logic_vector (4 downto 0);
begin
    -- Connecting testbench signals with tlc entity
    -- (Unit Under Test)
    uut_states_1 : entity work.states_1
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            backward =>'1', 
            forward =>'0',
            data0_o => s_data0,
            data1_o => s_data1,
            data2_o => s_data2,
            data3_o => s_data3,
            data4_o => s_data4,
            data5_o => s_data5,
            data6_o => s_data6,
            data7_o => s_data7         
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 10000 ns loop -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 200 ns;
        -- Reset activated
        s_reset <= '1'; wait for 500 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- No input data needed.
        wait;
    end process p_stimulus;

end architecture testbench;
