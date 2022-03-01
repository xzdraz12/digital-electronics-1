------------------------------------------------------------
--
-- Example of 4-bit binary comparator using the when/else
-- assignments.
-- EDA Playground

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 3-bit binary multiplexer
------------------------------------------------------------
entity multiplexer_3bit is
    port(
        b_i           : in  std_logic_vector(3 - 1 downto 0); -- 3 =  bitovy komparator
        a_i           : in  std_logic_vector(3 - 1 downto 0); -- to stejne zde
        c_i           : in  std_logic_vector(3 - 1 downto 0);
        d_i           : in  std_logic_vector(3 - 1 downto 0);
        sel_i         : in  std_logic_vector(3 - 1 downto 0); 
        f_o           : out std_logic_vector(3 - 1 downto 0) -- doplneno
    
    );
end entity multiplexer_3bit;

------------------------------------------------------------
-- Architecture body for 3-bit binary multiplexer
------------------------------------------------------------
architecture Behavioral of multiplexer_3bit is
begin
    f_o <= '1' when ( > a_i) else '0';
   
end architecture Behavioral;
