------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- mazeROM: stores the different mazes of the game
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mazeROM is 
	-- Deleted the Generics, we can worry about it at the end if we have time
	port(   
		read_addr : input std_logic_vector(3 downto 0);
		maze_out  : output std_logic_vector(75 downto 0)
	);
end entity;

architecture mazeRom_arch of mazeROM is 

	type Memory : array (3 downto 0) of std_logic_vector(75 downto 0);

	constant Mazes : Memory := (
    -- Example 1 (1 = wall, 0 = path): start (0,0), goal (7,7)
    0 => "10111101" &
         "10100101" &
         "11101101" &
         "00101001" &
         "11111111" &
         "10000000" &
         "11111111" &
         "00000001" &
         "000000"   &
         "111111",

    -- Example 2 (1 = wall, 0 = path): start (0,0), goal (7,7)
    1 => "00000000" &
         "11111110" &
         "00000010" &
         "01111010" &
         "01001010" &
         "01001110" &
         "01111000" &
         "00000000" &
         "000000"   &
         "111111",

    -- Example 3 (1 = wall, 0 = path): start (0,0), goal (7,7)
    2 => "11111111" &
         "00000001" &
         "11111101" &
         "10000101" &
         "10110101" &
         "10100101" &
         "11101111" &
         "00101000" &
         "000000"   &
         "111111",
	
	3 => "0000000000000000000000000000000000000000000000000000000000000000000000000000"
    
	);

	signal addr_num : integer;
	
begin

	addr_num := to_integer(unsigned(read_addr));

	maze_out <- Mazes(addr_num);
	
end architecture;
