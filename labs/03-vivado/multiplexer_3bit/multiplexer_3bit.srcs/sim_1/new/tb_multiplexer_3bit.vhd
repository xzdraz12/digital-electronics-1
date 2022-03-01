------------------------------------------------------------
-- Testbench for 4-bit binary comparator.
-- EDA Playground

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_multiplexer_3bit is
    -- Entity of testbench is always empty
end entity tb_multiplexer_3bit;

------------------------------------------------------------
-- Architecture body for testbench
-----------------------------------------------------------
architecture testbench of tb_multiplexer_3bit is

    -- Local signals
    signal s_a           : std_logic_vector(4 - 1 downto 0);
    signal s_b           : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit
    -- entity (Unit Under Test)
    uut_multiplexerr_3bit : entity work.multiplexerr_3bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

       	-- Test case for last two numbers of studentID: XXXX17
        s_b <= "0001"; s_a <= "0111"; wait for 100 ns;
        -- output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))

        report "Input combination 0001, 0111 FAILED" 
        severity error;
        
        
       -- case: simulated error
       	s_b <= "1111"; s_a <= "0000"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and 
        		(s_B_equals_A = '0') and 
        		(s_B_less_A = '0'))
        report "Input combination 1111 0000 FAILED"
        severity error;
        
        
        --third case:
        s_b <= "0000"; s_a <= "0011"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Input combination 0000 0011 FAILED"
        severity error;
        
        --fourth case:
        s_b <= "0001"; s_a <= "0000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Input combination 0001 0000 FAILED"
        severity error;
        
        --fifth case:
        s_b <= "0001"; s_a <= "0001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Input combination 0001 0001 FAILED"
        severity error;
     

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;
