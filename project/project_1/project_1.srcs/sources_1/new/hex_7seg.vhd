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

entity hex_7seg is
    Port ( hex_i : in STD_LOGIC_VECTOR (6-1 downto 0);
           seg_o : out STD_LOGIC_VECTOR (7-1 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is

begin 
    hex_7seg : process(hex_i)
    begin
        case hex_i is
            when "000000" =>
                seg_o <= "0000001"; -- 0
            when "000001" =>
                seg_o <= "1001111"; -- 1
            when "100010" =>
                seg_o <= "0010010"; -- 2
            when "100011" =>
                seg_o <= "0000110"; --3 
            when "100111" =>
                seg_o <= "1001100"; -- 4
            when "110111" =>
                seg_o <= "0100100"; -- 5
            when "110011" =>
                seg_o <= "0100000"; -- 6
            when "111011" =>
                seg_o <= "0001111"; --7
       
            when "011011" =>
                seg_o <= "0000000"; -- 8
            when "001011" =>
                seg_o <= "0000100"; -- 9
            when "000011" =>
                seg_o <= "0001000"; -- A
            when "000010" =>
                seg_o <= "1100000"; -- B
            when "000110" =>
                seg_o <= "0110001"; -- C
            when "000111" =>
                seg_o <= "1001000"; -- D

            
            when "001111" =>
                seg_o <= "0110000"; -- E
            when "001110" =>
                seg_o <= "0111000"; -- F
            --when "110011" =>
                --seg_o <= "1100000"; -- G
            when "011010" =>
                seg_o <= "1000001"; -- H
            --when "000001" =>
                --seg_o <= "1001111"; -- I
            
            when "110010" =>
                seg_o <= "0101000"; -- K 
            when "110110" =>
                seg_o <= "1110001"; -- L 
            when "100110" =>
                seg_o <= "0001001"; -- M 
            when "101110" =>
                seg_o <= "1101010"; -- N
            --when "000000" =>
                --seg_o <= "0000001"; -- O
            when "101111" =>
                seg_o <= "0011000"; -- P  
            --when "011011" =>
                --seg_o <= "0000000"; -- Q 
            when "101001" =>
                seg_o <= "1111010"; -- R 
            --when "101000" =>
                --seg_o <= "0100100"; -- S 
            --when "111011" =>
                --seg_o <= "0001111"; -- T 
            when "101010" =>
                seg_o <= "1100011"; -- U 
            when "100000" =>
                seg_o <= "1000001"; -- V 
            when "001010" =>
                seg_o <= "1000000"; -- W 
            when "111010" =>
                seg_o <= "1001001"; -- X  
            when "101101" =>
                seg_o <= "1000100"; -- Y 
            --when "100010" =>
                --seg_o <= "0010010"; -- Z 
            when others => --"101010" =>
                seg_o <= "1000111"; -- J
               
              
        end case;
        end process hex_7seg;



end Behavioral;

