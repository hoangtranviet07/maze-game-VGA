------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- gameController: contains the logic of the ball position and goal checking
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all; 

entity gameContoller is 

    port (
        Reset     : in std_logic;
        vert_sync : in std_logic;
        up, down, left, right : in std_logic; --These should all be active low I believe based on how KEY0 works
        timer_in  : in std_logic_vector(13 downto 0);
        maze_in   : in std_logic_vector(75 downto 0);
        maze_addr : out std_logic_vector(1 downto 0);
        maze_out  : out std_logic_vector(75 downto 0)
    );
end entity;

architecture gameController_arch of gameController is

    --When first loaded, ball position should be overwritten with the loaded mazes start positiion? A little clunk as is for now
    signal ball_position : std_logic_vector(5 downto 0);
begin

    --Will need button state tracking (pressed, held, released differences matter)

    --Loading mazes???

    MOVE_BALL : process (vert_sync) --Is anything else needed here?
    begin
        --Check for up, down, left, right inputs
        --Check if the desired grid position (current ball position + movement) is occupied
        --If it is, dont do anything
        --otherwise change ball position and
        --check if ball position == goal position
        --if so start the maze transition process. . . <-- Indicates state might be useful
    end process;

    --Replace the start position with the current ball position
    maze_out <= maze_in(75 downto 70) & ball_position & maze_in(63 downto 0);
end architecture;
