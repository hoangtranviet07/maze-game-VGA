------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- timer: controls the countdown timer that tells the player how much time they have left
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all; 
USE IEEE.std_logic_unsigned.all; 

entity timer is 
    generic(
        Default_Timer : integer := 6000;
    );
    port(
        Clock, Reset : in std_logic;
        output       : out std_logic_vector(13 downto 0); -- Can hold 9999
    );
end entity;

architecture timer_arch of timer is

    signal timer_value : integer;
    signal clock_100Hz : std_logic;

begin

    -- Do some math to determine how much CLOCK_50 should be divided to get 1 hundreth of a second frequency
    -- Implement some sort of ripple counter or other precision clock (see class slides)
    -- Then use that to govern the following process:

    COUNTDOWN : process (clock_100Hz, Reset)
    begin
        if (Reset = '0') then
            timer_value := Default_Timer;
        elsif (rising_edge(clock_100Hz)) then
            timer_value := timer_value - 1;
        end if; 
    end process;

    output <= CONV_STD_LOGIC_VECTOR(timer_value, 14); --lib required

end architecture;
