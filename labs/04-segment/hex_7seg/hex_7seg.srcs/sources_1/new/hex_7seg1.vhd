----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2022 01:43:18 PM
-- Design Name: 
-- Module Name: hex_7seg1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_7seg1 is
    Port ( hex_i : in STD_LOGIC_VECTOR (4-1 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7-1 downto 0));
end hex_7seg1;

architecture Behavioral of hex_7seg1 is

begin 
    hex_7seg1 : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001"; -- 0
            when "0001" =>
                seg_o <= "1001111"; -- 1
            when "0010" =>
                seg_o <= "0010010";
            when "0011" =>
                seg_o <= "0000110";
            when "0100" =>
                seg_o <= "1001100";
            when "0101" =>
                seg_o <= "0100100";
            when "0110" =>
                seg_o <= "0100000";
            when "0111" =>
                seg_o <= "0001111";
       
            when "1000" =>
                seg_o <= "0000000"; -- 8
            when "1001" =>
                seg_o <= "0000100";--9
            when "1010" =>
                seg_o <= "0001000";
            when "1011" =>
                seg_o <= "1100000";
            when "1100" =>
                seg_o <= "0110001";
            when "1101" =>
                seg_o <= "1000010";

            
            when "1110" =>
                seg_o <= "0110000"; -- E
            when others =>
                seg_o <= "0111000"; -- F
        end case;
        end process hex_7seg1;



end Behavioral;
