----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/05/08 09:17:27
-- Design Name: 
-- Module Name: pwm - Behavioral
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

entity pwm is
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
end pwm;

architecture Behavioral of pwm is
    signal Rst : std_logic;
 begin
 
    Rst <= '0';
    
    func_pwm : process(GCLK, Rst)
    
        constant pwm0_period : natural := 1000000; --1000000=5000us
        variable pwm0_duty : natural range 0 to pwm0_period := 0;
        variable pwm0_count : natural range 0 to pwm0_period := 0;
        variable dir : natural range 0 to 1 := 0;   
             
        constant max_delay_count : natural := 100; --1000000=5000us
        variable delay_count : natural range 0 to max_delay_count := 0;

    begin
    
        if Rst = '1' then
            pwm0_duty := 0;
        end if;
        
        if rising_edge(GCLK) then
            if pwm0_count < pwm0_duty then
                LD0 <= '1';
            else
                LD0 <= '0';
            end if;
            
            pwm0_count := pwm0_count + 1;
            if pwm0_count = pwm0_period then
                pwm0_count := 0;
            end if;
            
            delay_count := delay_count + 1;
            if delay_count = max_delay_count then
                delay_count := 0;
                if dir  = 0 then
                    pwm0_duty := pwm0_duty + 1;
                    if pwm0_duty = pwm0_period then
                        dir := 1;
                    end if;
                else
                    pwm0_duty := pwm0_duty - 1;
                    if pwm0_duty = 0 then
                        dir := 0;
                    end if;
                end if;
            end if;
            
        end if;
    end process func_pwm; 
    
end Behavioral;
