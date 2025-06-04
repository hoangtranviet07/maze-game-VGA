------------------------------------------------------------------
-- ECE 318: Final Project - Maze Game
-- Grant Bouvin, Collin Harrington, & Hoang Tran
-- mazeDisplay: runs the code to convert the maze to a video output
-- Date: 6/3/2025
------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all; 
USE IEEE.std_logic_unsigned.all; 

entity gameDisplay is

    port(
        pixel_row, pixel_column : std_logic_vector(9 downto 0);  --Current position VGA is drawing
        maze_in                 : std_logic_vector(75 downto 0);
        red, green, blue        : out std_logic                  --How to color the current pixel
    );
end entity;

architecture gameDisplay_arch of gameDisplay is 
begin

    DISPLAY_RGB : process --Sensitivity List???
        signal indexX, indexY : integer;
        signal indexPosition, ballPosition, goalPosition  : std_logic_vector(5 downto 0);
    begin
        -- Convert the pixel row and column into index positions
        indexX := to_integer(unsigned(pixel_row))    * 8 / 480 -- 8 for grid size 480 for number of rows. Note that divisible numbers are best
        indexY := to_integer(unsigned(pixel_column)) * 8 / 640 -- 8 for grid size 480 for number of rows. Note that divisible numbers are best

        -- indexPosition matches the format of ballPosition and goalPosition from stored mazes
        indexPosition := CONV_STD_LOGIC_VECTOR(indexX, 3) & CONV_STD_LOGIC_VECTOR(indexY, 3);

        goalPosition := maze_in(75 downto 70);
        ballPosition := maze_in(69 downto 64);

        -- set the color of the pixel based on what is at the current location
        if (indexPosition = goalPosition) then
            red <= '1'; green <= '1'; blue <= '0'; --Yellow
        elsif (indexPosition = ballPosition) then
            red <= '0'; green <= '0'; blue <= '1'; --Blue
        else

            if ( maze_in(indexY * 8 + indexX) = '1') then
                red <= '0'; green <= '0'; blue <= '0'; --Black
            else
                red <= '1'; green <= '1'; blue <= '1'; --White
            end if;
        end if;
    end process;

end architecture;
