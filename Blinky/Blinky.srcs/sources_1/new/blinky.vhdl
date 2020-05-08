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
    Port ( 
            GCLK : in STD_LOGIC;
            SW0 : in STD_LOGIC;
            SW1 : in STD_LOGIC;
            SW2 : in STD_LOGIC;
            SW3 : in STD_LOGIC;
            SW4 : in STD_LOGIC;
            SW5 : in STD_LOGIC;
            SW6 : in STD_LOGIC;
            SW7 : in STD_LOGIC;
            LD0 : out STD_LOGIC;
            LD1 : out STD_LOGIC;
            LD2 : out STD_LOGIC;
            LD3 : out STD_LOGIC;
            LD4 : out STD_LOGIC;
            LD5 : out STD_LOGIC;
            LD6 : out STD_LOGIC;
            LD7 : out STD_LOGIC
            );
end blinky;

architecture Behavioral of blinky is
    signal Rst : std_logic;
 begin
 
    Rst <= '0';
    
    func_main : process(GCLK, Rst)
    
        constant max_delay_count : natural := 1000*100000; --100000=1000us
        variable delay_count : natural range 0 to max_delay_count := 0;

    begin
    
        if Rst = '1' then
            delay_count := 0;
        end if;
        
        if rising_edge(GCLK) then
            if delay_count < max_delay_count/2 then
                LD0 <= '1';
            else
                LD0 <= '0';
            end if;
            
            delay_count := delay_count + 1;
            if delay_count = max_delay_count then
                delay_count := 0;
            end if;
        end if;
    end process func_main; 
    
    sw1_led1 : process(GCLK)
    begin
        if SW1 = '1' then
            LD1 <= '1';
        else
            LD1 <= '0';
        end if;
    end process sw1_led1; 
    
end Behavioral;
