library IEEE;

use IEEE.std_logic_1164.all;

entity mazeROM is 
	generic(
		NUM_MAZES : integer := 1;
		SIZE : integer := 8
	);
	port( RA : input std_logic_vector(NUM_MAZES - 1 downto 0); -- Fix this later
			Maze : output std_logic_vector(SIZE * SIZE - 1 downto 0);
			Goal : output std_logic_vector(5 downto 0) --Fix this 
end entity;

architecture mazeRom_arch of mazeROM is 

	type Memory : array (NUM_MAZES-1 downto 0) of std_logic_vector(SIZE * SIZE - 1 + 6 downto 0);

	constant Mazes : Memory := (); --Put a maze here

	signal addr_num : integer;
	
begin

	addr_num := to_integer(unsigned());
	
end architecture;
