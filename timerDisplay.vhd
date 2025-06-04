------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- timer: controls the countdown timer that tells the player how much time they have left
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- Going to need some Arith library I cant remember right now

entity timer is 
    port(
        timerInput : in std_logic_vector(13 downto 0);
        HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
    );
end entity;

architecture timer_arch of timer is

	component sevseg(
		input : in STD_LOGIC_VECTOR(3 downto 0);
		HEX  :  out STD_LOGIC_VECTOR(0 to 6)
	);

    signal timer_value : integer;
    signal clock_100Hz : std_logic;

    signal hundreths, tenths, ones, tens : std_logic_vector(3 downto 0);

begin

    timer_value <= to_integer(unsigned(timerInput)); --Should be a number from 0 to 9999

    tens      <= CONV_STD_LOGIC_VECTOR(timer_value / 1000, 4);
    ones      <= CONV_STD_LOGIC_VECTOR(, 4); --These need to be filled in. . .
    tenths    <= CONV_STD_LOGIC_VECTOR(, 4);
    hundreths <= CONV_STD_LOGIC_VECTOR(, 4);

    --Need to add the signals that correspond to each digit
    sevseg0 : sevseg port map (hundreths, HEX0);
    sevseg1 : sevseg port map (tenths, HEX1);
    sevseg2 : sevseg port map (tens, HEX2);
    sevseg3 : sevseg port map (ones, HEX3);
    
end architecture;
