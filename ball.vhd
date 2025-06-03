-- Bouncing Ball Video from DE2Core Library
-- Documentation added to clarify code behavior - CT

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all; 
USE  IEEE.STD_LOGIC_UNSIGNED.all; 


ENTITY ball IS

   PORT(pixel_row, pixel_column		: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        Red,Green,Blue 				: OUT std_logic;
        Vert_sync	: IN std_logic); -- Vert_sync signal is a clock input that triggers the Move_Ball process
       
END ball;

architecture behavior of ball is
--Internal Signals to implement ball presence, direction, size, motion, and posiiton  
SIGNAL Ball_on        				: std_logic;  --1 in area of ball, 0 otherwise
SIGNAL Size 						: STD_LOGIC_VECTOR(9 DOWNTO 0);  
SIGNAL Ball_Y_motion 				: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Ball_Y_pos, Ball_X_pos		: STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN            

Size <= CONV_STD_LOGIC_VECTOR(8,10); --sets size of ball to 8 pixels from center (16 x 16)
Ball_X_pos <= CONV_STD_LOGIC_VECTOR(320,10);  --conversion function to set initial ball position to middle 
											  -- of screen (column 320)
		-- Set color signals to define the color of the ball - these choices display a red ball on a white background
Red <=  '1'; 
		-- Turn off Green and Blue when displaying ball
Green <= NOT Ball_on;
Blue <=  NOT Ball_on;

-- Combinational process that generates the Ball_on bit for every location on the screen
-- Each part of "if" statement compares current pixel column and row to the X and Y position of the ball
-- If the current location is within the intended X and Y position of the ball, then Ball_on is set.
RGB_Display: Process (Ball_X_pos, Ball_Y_pos, pixel_column, pixel_row, Size)
BEGIN
-- Check if the current pixel column is within the Ball X posiion (+/- Size)
--        Ball_X_pos - Size -------------- Ball_X_pos + Size
-- Then check if the current pixel row is within the Ball Y position (+/- Size)
--                         Ball_Y_pos - Size
--                                 |
--                         Ball_Y_pos + Size
-- Comparisons manipulated to always compare positive numbers ('0'&) and sums

IF (pixel_column + Size >= '0' & Ball_X_pos) AND
 	('0' & pixel_column <= Ball_X_pos + Size) AND
 	(pixel_row + Size >= '0' & Ball_Y_pos) AND
 	('0' & pixel_row <= Ball_Y_pos + Size) THEN
 		Ball_on <= '1';
 	ELSE
 		Ball_on <= '0';
END IF;
END process RGB_Display;

-- Clocked process with vert_sync clock that sets the Y position of the ball. 
Move_Ball: process(vert_sync)
BEGIN
			-- Move ball once every vertical sync clock edge
--	WAIT UNTIL vert_sync'event and vert_sync = '1';
      if rising_edge(vert_sync) then 
			-- Bounce off top or bottom of screen
			-- After hitting bottom, start decrementing by 2 pixels each clock cycle
			IF ('0' & Ball_Y_pos) >= 480 - Size THEN
				Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(-2,10);
			-- After hitting top, start incrementing by 2 pixels each clock cycle
			ELSIF Ball_Y_pos <= Size THEN
				Ball_Y_motion <= CONV_STD_LOGIC_VECTOR(2,10);
			END IF;
			-- Compute next ball Y position
				Ball_Y_pos <= Ball_Y_pos + Ball_Y_motion;
		end if;
END process Move_Ball;

END behavior;