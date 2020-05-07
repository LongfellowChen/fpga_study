----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/05/05 16:57:11
-- Design Name: 
-- Module Name: blinky - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blinky is
    Port ( GCLK : in STD_LOGIC;
           LD0 : out STD_LOGIC);
end blinky;

architecture Behavioral of blinky is
    constant max_count : natural := 1000000; --1000000=5000us
    signal Rst : std_logic;
 begin

    Rst <= '0';
 
    -- 0 to max_count counter
    compteur : process(GCLK, Rst)
        variable count : natural range 0 to max_count;
    begin
        if Rst = '1' then
            count := 0;
            LD0 <= '1';
        elsif rising_edge(GCLK) then
            if count < max_count/2 then
                count := count + 1;
                LD0 <= '1';
            elsif count < max_count then
                LD0 <= '0';
                count := count + 1;
            else
                LD0 <= '1';
                count := 0;
            end if;
        end if;
    end process compteur; 
end Behavioral;
