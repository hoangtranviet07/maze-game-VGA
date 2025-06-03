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

	constant Mazes : Memory := (); --Put the mazes here

	signal addr_num : integer;
	
begin

	addr_num := to_integer(unsigned(read_addr));

	maze_out <- Mazes(addr_num);
	
end architecture;
