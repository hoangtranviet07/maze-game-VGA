------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- mazeDisplay: runs the code to convert the maze to a video output
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity gameDisplay is

    port(
        pixel_row, pixel_column : std_logic_vector(9 downto 0); //Current position VGA is drawing
        maze_in                 : std_logic_vector(75 downto 0);
        red, green, blue        : out std_logic //How to color the current pixel
    );
end entity;

architecture gameDisplay_arch of gameDisplay is 
begin

    DISPLAY_RGB : process //Sensitivity List???
    begin
        //Convert the pixel_row and pixel_column values to grid pos
        //This may be doable with simple truncation

        //check the contents of the corresponding space in maze
        //set RGB based on those contents
    end process;
end architecture;
